package com.dosirak31.health.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dosirak31.common.vo.CommonHealthVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

// 헬스 게시판 VO
@EqualsAndHashCode(callSuper = false)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthBoardVO extends CommonHealthVO {
	private int health_no;				// 헬스 게시글 번호
	private String health_title;			// 헬스 게시글 제목
	private String health_date;			// 작성 일시
	private int health_closed;			// 비공개 여부
	private int health_hits;			// 조회수
	private String health_contents;		// 게시글 내용
	private String health_url ="";		// 운동영상 url
	private String health_img = "";		// 헬스 이미지 (실제서버에 저장할 파일명)
	private int health_category_no;		// 헬스 카테고리 일련번호 (1번 웨이트 2번 카디오)
	private String health_update;		// 수정 일시
	private String admin_id;			// 관리자 아이디
	
	private MultipartFile file;			// 파일 업로드를 위한 필드
}
