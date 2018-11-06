package com.bc.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class memberDAO {
private static SqlSession ss;
memberVO vo = new memberVO();
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//전체 데이타 조회
	public static List<memberVO> getmemberList() {
		List<memberVO> list = getSql().selectList("memberlist");
		return list;
	}
	//내가쓴 글 조회
	public static List<BoardVO> getmyList(String id) {
		List<BoardVO> mylist = getSql().selectList("mylist", id);
		return mylist;
	}
	
	//아이디 조회
	public static memberVO selectId (String id) {
		return getSql().selectOne("idchk", id);
	}
	
	
	//로그인시 아이디, 비밀번호 체크
	public int loginCheck(String id, String pw) {
		vo = selectId(id);
		int chk = -1;
		System.out.println(vo);
		
		if (vo == null) { //로그인 아이디가 없음
			chk = -1;
		} else {
			if (vo.getPw().equals(pw)) {
				chk = 1; //비밀번호 일치 
			} else {
				chk = 0;
			}
		}
		return chk;
	}
	
	//회원가입시 아이디 중복체크 
	public boolean idCheck(String id) {
		boolean chk = false;
		vo = selectId(id);
		System.out.println("vo: " + vo);
		
		if (vo == null) {
			chk = false;
		} else if (vo.getId().equals(id)) {
			//아이디 중복일때(DB상에 아이디 있음)
			chk = true;
		} else {
			chk = false;
		}
		return chk;
		
	}
	
	
//	public int idCheck(String id) {
//		vo = selectId(id);
//		//int chk;
//		boolean chk = false;
//		System.out.println(vo);
//		
//		if (vo.getId().equals(id)) {
//			chk = 0; //아이디 중복일때(DB상에 아이디 있음)
//		} else {
//			chk = 1;
//		}
//		return chk;
//	}
	
	//회원가입
	public static int join(memberVO vo) {
		return getSql().insert("join", vo);
	}
	
	//내 정보 수정 
	public static int update(memberVO vo) {
		return getSql().update("updateMyinfo", vo);
		
	}
	
	//회원탈퇴
	public static int delete(String id) {
		return getSql().delete("deleteMtinfo", id);
	}
	
	
	
}
