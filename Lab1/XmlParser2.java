import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;



public class XmlParser2 {

	public static void main(String[] args) {
		
		File file = new File("order.xml");
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		//dbf.setNamespaceAware(true);
		DocumentBuilder db;
		
		try {
			
			db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			System.out.println("Document root element is: " + doc.getDocumentElement().getNodeName());
			
			/// Get the list of XML nodes from the root element...
			NodeList rootChildren = doc.getDocumentElement().getChildNodes();
				
			int qty = 0;
			double orderTotal = 0;			
			
			/// Loop through the list of nodes under the root element...
			for (int i=0; i<rootChildren.getLength(); i++) { 				  				
				
				/// If there whitespace between the elements in the file,
				/// it will be manifested as a "text" node, so filter these out...
				if (rootChildren.item(i).getNodeType() == Node.ELEMENT_NODE)
					System.out.print("\n" + rootChildren.item(i).getNodeName() + ": ");
				
				/// Every element will have at least one child node (the text value)... 
				NodeList subChildren = rootChildren.item(i).getChildNodes();				
				
				  
				/// Loop through the child nodes...
				for (int j=0; j<subChildren.getLength(); j++) {

					Node currentNode = subChildren.item(j);					
					
					/// If we have more child elements, parse them...
					if (currentNode.hasChildNodes()){
											
						/// Print the element name and the text value - text is in a child text node...
						System.out.print(currentNode.getNodeName() + ": " + currentNode.getFirstChild().getNodeValue());						
													
						/// Add to running total...							
						if (currentNode.getNodeName().equals("quantity"))	{
							qty = Integer.parseInt(currentNode.getFirstChild().getNodeValue()) ;
						}
						if (currentNode.getNodeName().equals("price"))			{						
							orderTotal += qty * Double.parseDouble(currentNode.getFirstChild().getNodeValue());
						}	  
					}
					/// If there are no child elements, this node is the text value...
					else
						System.out.print(currentNode.getNodeValue());	
				  }
				}						
			
			System.out.print("\nTotal Value: " + String.format("%.2f", orderTotal));
						
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		
	}

}