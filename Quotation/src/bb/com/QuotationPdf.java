package bb.com;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bb.com.dao.DaoFactory;
import bb.com.model.Client;
import bb.com.model.Config;
import bb.com.model.MainService;
import bb.com.model.Project;
import bb.com.model.SubService;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEvent;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;

public class QuotationPdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
			private static Font catFont1 = new Font(Font.FontFamily.UNDEFINED, 18,Font.BOLD);
			private static Font catFont2 = new Font(Font.FontFamily.UNDEFINED, 16);
			private static Font font3 = new Font(FontFamily.UNDEFINED, 28);
			private static Font font4 = new Font(Font.FontFamily.UNDEFINED,10,Font.BOLD,BaseColor.WHITE);
			private static Font font5 = new Font(Font.FontFamily.UNDEFINED,12,Font.BOLD,BaseColor.BLACK);
			private static Font fontCell = new Font(Font.FontFamily.UNDEFINED,12,Font.NORMAL,BaseColor.BLACK);
			private static Font font6 = new Font(Font.FontFamily.UNDEFINED,12,Font.BOLDITALIC,BaseColor.BLACK);
			private static Font font7 = new Font(Font.FontFamily.UNDEFINED,12,Font.BOLD,BaseColor.GRAY);
			private static Font font8 = new Font(Font.FontFamily.UNDEFINED,12,Font.NORMAL,BaseColor.GRAY);
			private static Font zapfdingbats = new Font(FontFamily.ZAPFDINGBATS, 6);
    public QuotationPdf() {
        super();
       
    }

    class MyFooter extends PdfPageEventHelper {
 
        public void onEndPage(PdfWriter writer, Document document) {
        	   
 		   PdfContentByte cb = writer.getDirectContent();
 		   Phrase footer = new Phrase("BlueBanyan Technologies Pvt. Ltd.",font7);
 		   Phrase footer1 = new Phrase("1st Floor, Mishra Bada, Tatyapara Chowk, Raipur (C.G.)",font8);
 		   Phrase footer2 = new Phrase("www.bluebanyan.co.in | info@bluebanyan.co.in | +91 9806868686",font8);
 		   
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 	                document.bottom()-10, 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer1,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-22 , 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer2,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-34, 0);
 		   	
        }
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int c_id = Integer.parseInt(request.getParameter("c_id"));
			int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		Document document = new Document();
		PdfWriter writer = null;
		document.setMargins(70f, 80f, 70f, 50f);
		try{
			Chunk glue = new Chunk(new VerticalPositionMark());
		    response.setContentType("application/pdf");
		    writer = PdfWriter.getInstance(document, response.getOutputStream());
		    /*MyFooter event = new MyFooter();
			writer.setPageEvent(event );*/
		    Client client = DaoFactory.getClientDao().getClient(c_id);
		    Project project = DaoFactory.getProjectDao().getProject(p_id);
		    String fileName = "Quotation-"+client.getClientName()+"-"+project.getTerm();
		    
		    response.addHeader("Content-Disposition", "attachment; filename=" + fileName+".pdf");
		    document.open();

		    addImage(request.getServletContext().getRealPath("/imgs/logo.png"), document);
		    addNewLine(document,1);
		    
		    Paragraph p2 =new Paragraph("Estimated To",catFont2);
		    p2.add(new Chunk(glue));
		    p2.add(new Paragraph("Date",catFont2));
		    document.add(p2);

		    Paragraph p3 =new Paragraph(client.getCompanyName() + "  ( "+client.getClientName()+" )");
		    p3.add(new Chunk(glue));
		    p3.add(new Paragraph(project.getTerm()));
		    document.add(p3);
		    
		    document.add(new Paragraph(client.getEmail()));
		    document.add(new Paragraph(client.getContactNumber()));
		    Phrase p  = new Phrase();
		    p.add(client.getCity());
		    if(client.getState()!=null && !client.getState().trim().equals("")){
		    	p.add(", "+client.getState());
		    }
		    if(client.getCountry()!=null && !client.getCountry().trim().equals("")){
		    	p.add(", "+client.getCountry());
		    }
		    	document.add(new Paragraph(p));
		    //document.add(new Paragraph(client.getCity()+", "+client.getState()+", "+client.getCountry()));
		  
		    addNewLine(document, 2);
		 
		   addTable(document,project.getMainServices());
		   addNewLine(document, 2);
		    
		   document.add(new Paragraph("We look forward for doing business with you. GST @18% extra, as applicable on the date of billing."));
		   addNewLine(document, 1);
		   
		   if(project.getExtraNote()!=null &&  !project.getExtraNote().trim().equals("")){
			   document.add(new Paragraph("Note:"));
			   document.add(new Paragraph(project.getExtraNote()));
			   
		   }
		   addNewLine(document, 4);
		   document.add(new Paragraph("Thanks & Regards:"));
		   document.add(new Paragraph(project.getSenderName(),font6));
		   	
		   
 		   PdfContentByte cb = writer.getDirectContent();
 		   Phrase footer = new Phrase("BlueBanyan Technologies Pvt. Ltd.",font7);
 		   Phrase footer1 = new Phrase("1st Floor, Mishra Bada, Tatyapara Chowk, Raipur (C.G.)",font8);
 		   Phrase footer2 = new Phrase("www.bluebanyan.co.in | info@bluebanyan.co.in | +91 9806868686",font8);
 		   
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 	                document.bottom()-10, 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer1,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-22 , 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer2,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-34, 0);
		   
		   
		
		    //Add more content here
		}catch(Exception e){
		    e.printStackTrace();
		}
		    document.close();
	}catch(Exception e){
		response.sendRedirect(Config.getBaseUrl()+"/AllQuotations");
	}
		}
	
	
	private static void addTable(Document document, ArrayList<MainService> mainServiceList) throws DocumentException{
		PdfPTable table = new PdfPTable(3); 
		table.setWidthPercentage(100);
		 float[] columnWidths = {1f, 4f, 2f};
	        table.setWidths(columnWidths);
		PdfPCell c1 = new PdfPCell(new Phrase("#",font4));
		c1.setPadding(5);
        //c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setBackgroundColor(BaseColor.BLACK );
        table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Item / Description",font4));
		c1.setPadding(5);
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setBackgroundColor(BaseColor.BLACK );
        table.addCell(c1);
        
        c1 = new PdfPCell(new Phrase("Amount",font4));
        c1.setPadding(5);
        c1.setHorizontalAlignment(Element.ALIGN_MIDDLE);
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        c1.setBackgroundColor(BaseColor.BLACK );
        table.addCell(c1);
        table.setHeaderRows(1);
        
        for(int i=0;i<3;i++){
        	c1 = new PdfPCell(new Phrase(" "));
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        }
		
        int amt =0;
        int i=1;
        for(MainService ms : mainServiceList){
        	c1=new PdfPCell(new Phrase(""+i+".",fontCell));
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        	c1=new PdfPCell(new Phrase(ms.getMainService(),font5));
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        	c1=new PdfPCell(new Phrase(""+ms.getCost()+"/-",fontCell));
        	c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        	amt += ms.getCost();
        	ArrayList<SubService> ssList = ms.getSubServices();
        	
        	Chunk bullet = new Chunk(String.valueOf((char) 108), zapfdingbats);
        	for(SubService ss : ssList){
        		c1=new PdfPCell(new Phrase(bullet));
            	c1.setBorder(PdfPCell.NO_BORDER);
            	c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            	c1.setHorizontalAlignment(PdfPCell.ALIGN_RIGHT);
            	table.addCell(c1);
        		c1=new PdfPCell(new Phrase(ss.getDescription(),fontCell));
            	c1.setBorder(PdfPCell.NO_BORDER);
            	table.addCell(c1);
            	c1=new PdfPCell(new Phrase(" "));
            	c1.setBorder(PdfPCell.NO_BORDER);
            	table.addCell(c1);
        	}
        	i++;
        	for(int j=0;j<3;j++){
            	c1 = new PdfPCell(new Phrase(" "));
            	c1.setBorder(PdfPCell.NO_BORDER);
            	table.addCell(c1);
            }                                                         /* for adding spaces between  two main services       */
        }
        /*
        for(i=0;i<3;i++){
        	c1 = new PdfPCell(new Phrase(" "));
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        }*/
        
		
        for(i=1;i<=3;i++){
        	 c1 = new PdfPCell(new Phrase("  "));
        	 c1.setFixedHeight(1);
            c1.setBackgroundColor(BaseColor.BLACK );
             table.addCell(c1);
        }
        
       /* c1 = new PdfPCell(new Phrase("  "));
   	   c1.setFixedHeight(4);
   	   c1.setBorder(PdfPCell.NO_BORDER);
       c1.setBackgroundColor(BaseColor.LIGHT_GRAY );
        table.addCell(c1);*/
        
        for(i=1;i<=2;i++){
        	c1 = new PdfPCell(new Phrase("  "));
        	c1.setBorder(PdfPCell.NO_BORDER);
        	table.addCell(c1);
        }
        
        c1 = new PdfPCell(new Phrase("Total     Rs. "+ amt+"/-", font5 ));
        c1.setPadding(5);
        c1.setBackgroundColor(BaseColor.LIGHT_GRAY);
        c1.setBorder(PdfPCell.NO_BORDER);
        table.addCell(c1);
        
        
        for(i=1;i<=3;i++){
       	 c1 = new PdfPCell(new Phrase("  "));
       	 c1.setFixedHeight(1);
           c1.setBackgroundColor(BaseColor.BLACK );
            table.addCell(c1);
       }
        
        
		document.add(table);
		
		}
	
	private static void addNewLine(Document document,int n) throws DocumentException{
		for(int i=1 ; i<= n ; i++){
			  document.add(new Paragraph("   "));
		}
	}
	 private static void addImage(String imagePath, Document document)
	            throws DocumentException, MalformedURLException, IOException {
	    	Image image1 = Image.getInstance(imagePath);
	     
//	        String imageUrl =Config.getBbLogoPath();
//	        Image image1 = Image.getInstance(new URL(URLEncoder.encode(Config.getBaseUrl()+"/imgs/logo.png")));
	        image1.scalePercent(50f);                /*  using link */
	     
	        
	        
	        PdfPTable table = new PdfPTable(2);
	        table.setWidthPercentage(100);
	        PdfPCell c1 = new PdfPCell(image1);
	        c1.setBorder(PdfPCell.NO_BORDER);
	        c1.setHorizontalAlignment(Element.ALIGN_LEFT);
	        table.addCell(c1);
	        PdfPCell c2 = new PdfPCell(new Phrase("Quotation\n",font3));
	        c2.setBorder(PdfPCell.NO_BORDER);
	        c2.setHorizontalAlignment(Element.ALIGN_RIGHT);
	        table.addCell(c2);
	        
	        document.add(table);
	        
	        // Start a new page
	       // document.newPage();
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int c_id = Integer.parseInt(request.getParameter("c_id"));
			int p_id = Integer.parseInt(request.getParameter("p_id"));
		
		Document document = new Document();
		PdfWriter writer = null;
		document.setMargins(70f, 80f, 70f, 50f);
		try{
			Chunk glue = new Chunk(new VerticalPositionMark());
		    response.setContentType("application/pdf");
		    writer = PdfWriter.getInstance(document, response.getOutputStream());
		    /*MyFooter event = new MyFooter();
			writer.setPageEvent(event );*/
		    Client client = DaoFactory.getClientDao().getClient(c_id);
		    Project project = DaoFactory.getProjectDao().getProject(p_id);
		    String fileName = "Quotation-"+client.getClientName()+"-"+project.getTerm();
		    
		    response.addHeader("Content-Disposition", "attachment; filename=" + fileName+".pdf");
		    document.open();
		    
		    addImage(request.getServletContext().getRealPath("/imgs/logo.png"), document);
		    addNewLine(document,1);
		    
		    
		    Paragraph p2 =new Paragraph("Estimated To",catFont2);
		    p2.add(new Chunk(glue));
		    p2.add(new Paragraph("Date",catFont2));
		    document.add(p2);

		    Paragraph p3 =new Paragraph(client.getCompanyName() + "  ( "+client.getClientName()+" )");
		    p3.add(new Chunk(glue));
		    p3.add(new Paragraph(project.getTerm()));
		    document.add(p3);
		    
		    document.add(new Paragraph(client.getEmail()));
		    document.add(new Paragraph(client.getContactNumber()));
		    document.add(new Paragraph(client.getCity()+", "+client.getState()+", "+client.getCountry()));
		  
		    addNewLine(document, 2);
		 
		   addTable(document,project.getMainServices());
		   addNewLine(document, 2);
		    
		   document.add(new Paragraph("We look forward for doing business with you. GST @18% extra, as applicable on the date of billing."));
		   addNewLine(document, 1);
		   document.add(new Paragraph("Note:"));
		   document.add(new Paragraph(project.getExtraNote()));
		   addNewLine(document, 4);
		   document.add(new Paragraph("Thanks & Regards:"));
		   document.add(new Paragraph(project.getSenderName(),font6));
		   	
		   
 		   PdfContentByte cb = writer.getDirectContent();
 		   Phrase footer = new Phrase("BlueBanyan Technologies Pvt. Ltd.",font7);
 		   Phrase footer1 = new Phrase("1st Floor, Mishra Bada, Tatyapara Chowk, Raipur (C.G.)",font8);
 		   Phrase footer2 = new Phrase("www.bluebanyan.co.in | info@bluebanyan.co.in | +91 9806868686",font8);
 		   
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 	                document.bottom()-10, 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer1,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-22 , 0);
 		   ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,footer2,
 				   (document.right() - document.left()) / 2 + document.leftMargin(),
 				   document.bottom()-34, 0);
		   
		   
		
		
		    //Add more content here
		}catch(Exception e){
		    e.printStackTrace();
		}
		    document.close();
		}catch(Exception e){
			response.sendRedirect(Config.getBaseUrl()+"/AllQuotations");
		}
	}

}
