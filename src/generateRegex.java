import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;;

/**
 * Servlet implementation class generateRegex
 */
@WebServlet("/generateRegex")
public class generateRegex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public generateRegex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// IF user directly hits /generateRegex redirect to homepage
		response.sendRedirect("index.jsp"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String des = "index.jsp";
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(des);
			String originalString = request.getParameter("string");
			//doGet(request, response);
			HashMap<String, String> map;
			ObjectMapper mapper = new ObjectMapper();
	        String json = "{\"`\": \"\\\\`\",\"|\":\"\\\\|\", \"/\": \"\\\\/\", \"%\": \"\\\\%\", \"$\": \"\\\\$\", \":\": \"\\\\:\", \"@\": \"\\\\@\", \"#\": \"\\\\#\",\"&\": \"\\\\&\", \"!\": \"\\\\!\", \"^\": \"\\\\^\", \"\\\\\": \"\\\\\\\\\", \".\": \"\\\\.\", \"-\": \"\\\\-\", \"+\": \"\\\\+\", \")\": \"\\\\)\", \"(\": \"\\\\(\", \"[\": \"\\\\[\", \"]\": \"\\\\]\", \"{\": \"\\\\{\", \"}\": \"\\\\}\", \"_\": \"\\\\_\", \"~\": \"\\\\~\", \"=\": \"\\\\=\", \">\": \"\\\\>\", \"<\": \"\\\\<\", \",\": \"\\\\,\", \"?\": \"\\\\?\", \"*\": \"\\\\*\", \"\'\": \"\\\\\'\",\"\\\"\": \"\\\\\\\"\"}";
	        String regexString = "";
	        String stringTemp=originalString;
	        String result = "";
	        String myraRegex = "";
	        try {
	            // convert JSON string to Map
	            map = mapper.readValue(json, HashMap.class);
	            for(int i = 0; i<stringTemp.length(); i++) {
	            	char r = stringTemp.charAt(i);
	            	String key = Character.toString(r);
	            	if(map.containsKey(key)) {
	            		String val = map.get(key);
	            		result = result+val;
	            	}
	            	else {
	            		result = result+key;
	            	}
	            }
	            result = result.replace(" ", "\\s*");
	            result = result.replaceAll("[^\\x00-\\x7F]", "\\\\W");
	            stringTemp = null;
	            regexString = result;
	            result = result.replace("\\", "\\\\");
	            myraRegex = ".*"+result+".*";
	            result = null;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	     
	        //System.out.println("String after replacement= "+result);
	        request.setAttribute("orginalString", originalString);
	        request.setAttribute("regexString", regexString);
	        request.setAttribute("myraRegex", myraRegex);
			requestDispatcher.forward(request, response);
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
		}
	}

}
