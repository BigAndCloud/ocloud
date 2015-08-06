package com.ourselec.ocloud.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Service;

import com.ourselec.ocloud.domain.DeviceModel;
//import mons.fileupload.FileItem;
//import mons.fileupload.FileUploadException;
//import mons.fileupload.disk.DiskFileItemFactory;
//import mons.fileupload.servlet.ServletFileUpload;
public class UpLoad extends HttpServlet {

@Override
protected void service(HttpServletRequest req, HttpServletResponse resp)
                                            throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html;charset=utf-8");
			//为解析类提供配置信息
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//创建解析类的实例
			ServletFileUpload sfu = new ServletFileUpload(factory);
			//开始解析
			sfu.setFileSizeMax(1024*400);
			//每个表单域中数据会封装到一个对应的FileItem对象上
			
//			String  company_name= req.getParameter("company_name").toString();
//			System.out.println("company_name==="+company_name);
		try {  
			List<FileItem> items = sfu.parseRequest(req);
			
			//区分表单域
			for (int i = 0; i < items.size(); i++) {
				FileItem item = items.get(i);
				//isFormField为true，表示这不是文件上传表单域
				
					if(item.isFormField()){
						String name = item.getString("UTF-8");
						System.out.println("name===="+ name);
						String fileName = item.getFieldName();
						System.out.println(fileName);
					}else{
					ServletContext sctx = getServletContext();
					//获得存放文件的物理路径
					//upload下的某个文件夹 得到当前在线的用户 找到对应的文件夹
					
				//	String path = sctx.getRealPath("D:/workspace-sts-3.6.3.RELEASE/upload");
					String path="D:/workspace-sts-3.6.3.RELEASE/upload";
					System.out.println(path);
					//获得文件名
					String fileName = item.getName();
					
					System.out.println(fileName);
					
					//该方法在某些平台(操作系统),会返回路径+文件名
					fileName = fileName.substring(fileName.lastIndexOf("/")+1);
					File file = new File(path+"\\"+fileName);
				if(!file.exists()){
					item.write(file);
				//将上传图片的名字记录到数据库中
				
				//	boolean fale = DeviceModel.addModel(developer_id,vendor_id,model_name,model_id,null,text_encoding_id,binary_encoding_id,picture,comment);
					
					resp.sendRedirect("upload/l");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			}

	}
}