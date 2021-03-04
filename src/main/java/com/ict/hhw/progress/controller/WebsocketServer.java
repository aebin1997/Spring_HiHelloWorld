package com.ict.hhw.progress.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.*;
import javax.websocket.RemoteEndpoint.Basic;

import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/ws/websocketendpoint")
public class WebsocketServer {
	
	 private static final List<Session> sessionList = new ArrayList<Session>();

	   public WebsocketServer() {}


	@OnOpen //클라이언트가 소켓에 연결될 때마다 호출
	    public void onOpen(Session session){
	      try {
	         final Basic basic = session.getBasicRemote();
	         basic.sendText("대화방에 연결되었습니다.");
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	      
	      sessionList.add(session);
	      
	        //System.out.println("Open Connection ...");
	    }
	   
	    // 모든 사용자에게 메시지를 전달
	    private void sendAllSessionToMessage(Session self, String sender, String message) {
	       try {
	          for(Session session : WebsocketServer.sessionList) {
	             if(!self.getId().equals(session.getId())) {
	                session.getBasicRemote().sendText(sender + "|" + message);
	             }
	          }
	       }catch(Exception e) {
	          System.out.println(e.getMessage());
	       }
	       
	    }
	   
	    @OnMessage // 내가 입력하는 메세지
	    public void onMessage(String message, Session session){
	       
	       
	       String sender = message.split("\\|")[0];
	       
	       message = message.split("\\|")[1];
	       
	        //System.out.println("Message from the client: " + message);
	        
	        try {
	           final Basic basic = session.getBasicRemote();
	           basic.sendText("나 : " + message);
	        }catch (Exception e) {
	           System.out.println(e.getMessage());
	      }
	        
	        sendAllSessionToMessage(session, sender, message);
	    }
	    
	   
	   
	     
	    @OnClose //클라이언트와 소켓과의 연결이 닫힐 때(끊길 때) 마다 호출
	    public void onClose(Session session){
	       sessionList.remove(session);
	        //System.out.println("Close Connection ...");
	    }
	     
	    
	    
	    @OnError
	    public void onError(Session session, Throwable e){
	        e.printStackTrace();
	    }
	    


}
