package com.spring.dao;

import java.util.List;

import com.spring.dto.ChatListVO;
import com.spring.dto.ChatVO;

public interface ChatDAO {

	List<ChatListVO> getList(String fromID, String toID, int cno);

	void regist(String fromID, String toID, String content);

	void readModify(String toID, String fromID);

	int unreadCount(String fromID);

	List<ChatVO> getMessageList(String fromID);
	
	int getChatListCount(String search_option,String keyword);
	
	List<ChatVO> getChatList(int start,int end,String search_option,String keyword);
	
	void delete(int cno);
	
	ChatVO getChatVO(int cno);
	
	void chatModify(ChatVO vo);

}
