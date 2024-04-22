package com.camp.going.dto.request;

import com.camp.going.entity.Review;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Setter @Getter @ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewRequestDTO {

    private String reviewContent; // 리뷰 내용
    //    private String email; // 리뷰 작성자
    private MultipartFile reviewImage;
    private String reviewPoint;
    private LocalDateTime reviewDate;

    public Review toEntity(String savePath) {
        return Review.builder()
                .reviewContent(reviewContent)
                .reviewImage(savePath)
                .reviewPoint(reviewPoint)
                .reviewDate(reviewDate)
                .build();
    }

}