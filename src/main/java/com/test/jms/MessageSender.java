package com.test.jms;

import java.util.Date;
import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import org.apache.activemq.ActiveMQConnectionFactory;
 
 
 
/**
 * 消息发送器
 * @author xiaochuanyu
 *
 */
public class MessageSender implements Runnable {
     
    private String url;
    private String user;
    private String password;
    private final String QUEUE;
 
    public MessageSender(String queue, String url, String user, String password) {
        this.url = url;
        this.user = user;
        this.password = password;
        this.QUEUE = queue;
    }
 
    @Override
    public void run() {
        ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory(
                user, password, url);
        Session session = null;
        Destination sendQueue;
        Connection connection = null;
 
        int messageCount = 0;
        try {
            connection = connectionFactory.createConnection();
 
            connection.start();
 
            while (true) {
                session = connection.createSession(true,
                        Session.SESSION_TRANSACTED);
 
                sendQueue = session.createQueue(QUEUE);
                //创建一个生产者
                MessageProducer sender = session.createProducer(sendQueue);
                TextMessage outMessage = session.createTextMessage();
                outMessage.setText(new Date() + "现在发送是第" + messageCount + "条消息");
 
                sender.send(outMessage);
 
                session.commit();
 
                sender.close();
 
                if ((++messageCount) == 10) {
                    // 发够十条消息退出
                    break;
                }
                Thread.sleep(1000);
            }
            connection.close();
        } catch (JMSException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
    public String getUrl() {
        return url;
    }
 
    public void setUrl(String url) {
        this.url = url;
    }
 
    public String getUser() {
        return user;
    }
 
    public void setUser(String user) {
        this.user = user;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
}