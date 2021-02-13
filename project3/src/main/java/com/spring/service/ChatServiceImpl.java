package com.spring.service;

import java.util.List;

import com.spring.dao.ChatDAO;
import com.spring.dao.MemberDAO;
import com.spring.dto.ChatListVO;
import com.spring.dto.ChatVO;

public class ChatServiceImpl implements ChatService{
	private ChatDAO chatDAO;

	public void setChatDAO(ChatDAO chatDAO) {
		this.chatDAO = chatDAO;
		
	}

	@Override
	public List<ChatListVO> getList(String fromID, String toID, int cno) {
		List<ChatListVO> list = chatDAO.getList(fromID,toID,cno);
		return list;
	}

	@Override
	public void regist(String fromID, String toID, String content) {
		chatDAO.regist(fromID,toID,content);
		
	}

	@Override
	public void readModify(String toID, String fromID) {
		chatDAO.readModify(toID,fromID);
		
	}

	@Override
	public int unreadCount(String fromID) {
		int count = chatDAO.unreadCount(fromID);
		return count;
	}

	@Override
	public List<ChatVO> getMessageList(String fromID) {
		List<ChatVO> list = chatDAO.getMessageList(fromID);
		System.out.println("chatList:"+list.toString());
		for(int i = 0; i <list.size();i++) {
			ChatVO x = list.get(i);
			for(int j = 0; j <list.size();j++) {
				ChatVO y = list.get(j);
				if(x.getFromID().equals(y.getToID()) && x.getToID().equals(y.getFromID())) {
					if(x.getCno() < y.getCno()) {
						list.remove(list.get(i));
					}else {
						list.remove(list.get(j));
					}
				}
			}
		}
		
		return list;
	}

	@Override
	public int getChatListCount(String search_option, String keyword) {
		int count = chatDAO.getChatListCount(search_option,keyword);
		return count;
	}

	@Override
	public List<ChatVO> getChatList(int start, int end, String search_option, String keyword) {
		List<ChatVO> list = chatDAO.getChatList(start,end,search_option,keyword);
		return list;
	}

	@Override
	public void delete(int cno) {
		chatDAO.delete(cno);
		
	}

	@Override
	public ChatVO getChatVO(int cno) {
		ChatVO vo = chatDAO.getChatVO(cno);
		return vo;
	}

	@Override
	public void chatModify(ChatVO vo) {
		chatDAO.chatModify(vo);
		
	}
	
	
	
	
}
