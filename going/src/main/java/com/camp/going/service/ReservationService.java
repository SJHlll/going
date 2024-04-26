package com.camp.going.service;

import com.camp.going.dto.request.ReservationRequestDTO;
import com.camp.going.entity.Reservation;
import com.camp.going.mapper.ReservationMapper;
import com.camp.going.util.LoginUtils;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationMapper reservationMapper;

    private final UserService userService;

    private final CampingService campingService;


//    public List<ReservationResponseDTO> getReservationList(int userId, int campId) {
//
//        Reservation reservation = reservationMapper.selectReservation(userId);
//
//        List<ReservationResponseDTO> reservationResponseDTOList = new ArrayList<>();
//
//
//
//        return null;
//
//
//
//
//
//    }


    public void getReservation(ReservationRequestDTO dto, HttpSession session) {

        Reservation reservation = dto.toEntity();
        reservation.setUserId(LoginUtils.getCurrentLoginMemberId(session));

        reservationMapper.reservationSave(reservation);


    }
}
