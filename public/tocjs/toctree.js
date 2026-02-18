
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
     
var objd4e11 = { label: "Setup", href:"", target:"contentwin" };
    var d4e11 = new YAHOO.widget.TextNode(objd4e11, root, false);var objd4e18 = { label: "Setting Variables", href:"", target:"contentwin" };
    var d4e18 = new YAHOO.widget.TextNode(objd4e18, d4e11, false);var objd4e25 = { label: "Displaying Set of Data", href:"", target:"contentwin" };
    var d4e25 = new YAHOO.widget.TextNode(objd4e25, d4e11, false);
    var objd4e33 = { label: "Usage", href:"", target:"contentwin" };
    var d4e33 = new YAHOO.widget.TextNode(objd4e33, root, false);var objd4e40 = { label: "Running SWCMS", href:"", target:"contentwin" };
    var d4e40 = new YAHOO.widget.TextNode(objd4e40, d4e33, false);var objd4e47 = { label: "Creating a Form", href:"", target:"contentwin" };
    var d4e47 = new YAHOO.widget.TextNode(objd4e47, d4e33, false);var objd4e54 = { label: "Creating Entries - HTML Coding", href:"", target:"contentwin" };
    var d4e54 = new YAHOO.widget.TextNode(objd4e54, d4e33, false);var objd4e61 = { label: "Running DITA OT 3.0", href:"", target:"contentwin" };
    var d4e61 = new YAHOO.widget.TextNode(objd4e61, d4e33, false); 

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    