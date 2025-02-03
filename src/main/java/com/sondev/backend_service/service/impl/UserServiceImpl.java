package com.sondev.backend_service.service.impl;

import com.sondev.backend_service.common.UserStatus;
import com.sondev.backend_service.controller.request.UserCreateRequest;
import com.sondev.backend_service.controller.request.UserPasswordRequest;
import com.sondev.backend_service.controller.request.UserUpdateRequest;
import com.sondev.backend_service.controller.response.UserPageResponse;
import com.sondev.backend_service.controller.response.UserResponse;
import com.sondev.backend_service.exception.ResourceNotFoundException;
import com.sondev.backend_service.model.AddressEntity;
import com.sondev.backend_service.model.UserEntity;
import com.sondev.backend_service.repository.AddressRepository;
import com.sondev.backend_service.repository.UserRepository;
import com.sondev.backend_service.service.EmailService;
import com.sondev.backend_service.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j(topic = "USER-SERVICE")
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final AddressRepository addressRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    /// Constructor
    public UserServiceImpl(UserRepository userRepository, AddressRepository addressRepository, PasswordEncoder passwordEncoder, EmailService emailService) {
        this.userRepository = userRepository;
        this.addressRepository = addressRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }


    @Override
    public UserPageResponse findAll(String keyword, String sort, int page, int size) {
        log.info("findAll start");

        Sort.Order order = new Sort.Order(Sort.Direction.ASC, "id");
        if (StringUtils.hasLength(sort)) {
            Pattern pattern = Pattern.compile("(\\w+?)(:)(.*)"); // tencot:asc|desc
            Matcher matcher = pattern.matcher(sort);
            if (matcher.find()) {
                String columnName = matcher.group(1);
                if (matcher.group(3).equalsIgnoreCase("asc")) {
                    order = new Sort.Order(Sort.Direction.ASC, columnName);
                } else {
                    order = new Sort.Order(Sort.Direction.DESC, columnName);
                }
            }
        }

        /* Xử lý trường hợp FE muốn bắt đầu với page = 1. */
        int pageNo = 0;
        if (page > 0) {
            pageNo = page - 1;
        }

        // Paging
        Pageable pageable = PageRequest.of(pageNo, size, Sort.by(order));

        Page<UserEntity> entityPage;
        if (StringUtils.hasLength(keyword)) {
            keyword = "%" + keyword.toLowerCase() + "%";
            entityPage = userRepository.searchByKeyword(keyword, pageable);
        } else {
            entityPage = userRepository.findAll(pageable);
        }

        return getUserPageResponse(page, size, entityPage);
    }

    @Override
    public UserResponse findById(Long id) {
        UserEntity user = getUserEntity(id);
        UserResponse userResponse = new UserResponse();
        userResponse.setId(user.getId());
        userResponse.setFirstName(user.getFirstName());
        userResponse.setLastName(user.getLastName());
        userResponse.setLastName(user.getLastName());
        userResponse.setGender(user.getGender());
        userResponse.setPhone(user.getPhone());
        userResponse.setEmail(user.getEmail());


        return userResponse;
    }

    @Override
    public UserResponse findByUsername(String username) {
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public long save(UserCreateRequest request) {
        log.info("Saving user: {}", request);
        UserEntity user = new UserEntity();
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setGender(request.getGender());
        user.setBirthday(request.getBirthDay());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setUsername(request.getUserName());
        user.setType(request.getType());
        user.setStatus(UserStatus.NONE);
        userRepository.save(user);

        if (user.getId() != null) {
            List<AddressEntity> addresses = new ArrayList<>();
            request.getAddresses().forEach(address -> {
                AddressEntity addressEntity = new AddressEntity();
                        addressEntity.setAddressType(address.getAddressType());
                        addressEntity.setApartmentNumber(address.getApartmentNumber());
                        addressEntity.setBuilding(address.getBuilding());
                        addressEntity.setCity(address.getCity());
                        addressEntity.setCountry(address.getCountry());
                        addressEntity.setFloor(address.getFloor());
                        addressEntity.setStreet(address.getStreet());
                        addressEntity.setStreetNumber(address.getStreetNumber());
                        addressEntity.setUserId(user.getId());
                addresses.add(addressEntity);
            });
            addressRepository.saveAll(addresses);
//            log.info("Saved address: {}", addresses);
        }

        // send email
        try {
            emailService.emailVerification(request.getEmail(), request.getUserName());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return user.getId();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(UserUpdateRequest request) {
        /* Get user by id; */
        UserEntity user = getUserEntity(request.getId());
        /* set data */
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setGender(request.getGender());
        user.setBirthday(request.getBirthDay());
        user.setPhone(request.getPhone());

        /* save to database */
        userRepository.save(user);
        /* save address */
        List<AddressEntity> addresses = new ArrayList<>();

        request.getAddresses().forEach(address -> {
            AddressEntity addressEntity = addressRepository.findByUserIdAndAddressType(user.getId(), address.getAddressType());
            if (addressEntity != null) {
                addressEntity = new AddressEntity();
            }
            addressEntity.setApartmentNumber(address.getApartmentNumber());
            addressEntity.setFloor(address.getFloor());
            addressEntity.setBuilding(address.getBuilding());
            addressEntity.setStreetNumber(address.getStreetNumber());
            addressEntity.setStreet(address.getStreet());
            addressEntity.setCity(address.getCity());
            addressEntity.setCountry(address.getCountry());
            addressEntity.setAddressType(address.getAddressType());

            addresses.add(addressEntity);
        });
        /* save addresses */
        addressRepository.saveAll(addresses);
//        log.info("Updated addresses: {}", addresses);
    }

    @Override
    public void changePassword(UserPasswordRequest request) {
//        log.info("Changing password for user: {}", request);
        /* Get user by id */
        UserEntity user = getUserEntity(request.getId());
        if (request.getPassword().equals(request.getConfirmPassword())) {
            user.setPassword(passwordEncoder.encode(request.getPassword()));
        }

        userRepository.save(user);
    }

    @Override
    public void delete(Long id) {
//        log.info("Deleting user: {}", id);
        /* Get user by id */
        UserEntity user = getUserEntity(id);
        user.setStatus(UserStatus.INACTIVE);
        userRepository.save(user);
//        log.info("Deleted user: {}", user);
    }

    /**
     * Get user by id.
     *
     * @param id
     * @return {@link UserEntity}
     */
    private UserEntity getUserEntity(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found"));
    }

    /**
     * Convert UserEntity to UseResponse
     *
     * @param page
     * @param size
     * @param userEntities
     * @return
     */
    private static UserPageResponse getUserPageResponse(int page, int size, Page<UserEntity> userEntities) {
//        log.info("Convert user entity page");
        List<UserResponse> userList = userEntities.stream().map(
                userEntity -> {
                    UserResponse userResponse = new UserResponse();
                    userResponse.setId(userEntity.getId());
                    userResponse.setFirstName(userEntity.getFirstName());
                    userResponse.setLastName(userEntity.getLastName());
                    userResponse.setGender(userEntity.getGender());
                    userResponse.setUserName(userEntity.getUsername());
                    userResponse.setPhone(userEntity.getPhone());
                    userResponse.setEmail(userEntity.getEmail());
                    return userResponse;
                }
        ).toList();


        UserPageResponse response = new UserPageResponse();
        response.setPageNumber(page);
        response.setPageSize(size);
        response.setTotalElement(userEntities.getTotalElements());
        response.setTotalPage(userEntities.getTotalPages());
        response.setUsers(userList);
        return response;
    }
}
