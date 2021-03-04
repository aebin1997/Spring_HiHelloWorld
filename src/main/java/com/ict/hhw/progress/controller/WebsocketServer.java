package com.ict.hhw.progress.controller;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ws/websocketendpoint")
public class WebsocketServer {
	
	@OnOpen
    public void onOpen(){
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
