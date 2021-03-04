package com.ict.hhw.progress.controller;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.ui.Model;

@ServerEndpoint("/ws/websocketendpoint")
public class WebsocketServer {
	
	@OnOpen
    public void onOpen(Session session){
        System.out.println("Open Connection ...");
    }
     
    @OnClose
    public void onClose(){
        System.out.println("Close Connection ...");
    }
     
    @OnMessage
    public String onMessage(String message){
        System.out.println("Message from the client: " + message);
        //String echoMsg = "Echo from the server : " + message;
        return message;
    }
    
    @OnError
    public void onError(Throwable e){
        e.printStackTrace();
    }

}
