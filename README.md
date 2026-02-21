# Sinatra Web-Based DITA Content Management System (sinatra_json1)

I started this project several years ago. The original intent of the project was to post lists of my favorite things (similar to RSS feeds). The project then morphed into a simple content magaement system (CMS) for DITA. The system uses Sinatra (a Ruby-based web framework) to host its forms. It used datamapper as the database for storing the contents from the web forms, but the newer version of ruby no longer supports datamapper. I am using a json file to store the form data now. The form setup is very primitive, but you can customize the forms to suit your project needs. Examples are included in the database that is provided with this project.

There are two modes for creating maps and topics with this system:
- HTML - Uses jQuery TE HTML editor and converts HTML into DITA.
- Markdown - Uses markdown language with DITA OT.

You can find instructions in the **docs** folder of this project (both in PDF and HTML formats).

## Required Software

- jQuery TE - Used as a WYSIWYG HTML editor.
- Ruby
- Sinatra - Used for quickly creating web applications in Ruby.
``` Ruby
gem install sinatra
```
- json - Used as the database
``` Ruby
gem install json
```
- erb - Used for creating a Framework for the pages of web application
- DITA OT - Used to output the contents in different formats (xhtml, PDF, PDF2, and so on). A newer implementation allows the use of markdown language.

