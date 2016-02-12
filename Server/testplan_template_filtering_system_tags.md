### Filtering files by system tags test plan

| Test Case                                | Expected Result                          | Result | Related Comment |
| ---------------------------------------- | ---------------------------------------- | ------ | --------------- |
| Assign tags to files and folders, include tags with special characters. Assign tags to files inside nested directories. Go to the tags section. Search them. | Files or folders tagged appear.          |        |                 |
| Search tags using internet explorer 11.  | Files or folders tagged appear.          |        |                 |
| Search tags using safari.                | Files or folders tagged appear.          |        |                 |
| Search tags using firefox.               | Files or folders tagged appear.          |        |                 |
| Search tags using chrome.                | Files or folders tagged appear.          |        |                 |
| Search tags using edge.                  | Files or folders tagged appear.          |        |                 |
| Having tags on files and folders assigned, deassign some. Go to the tags section. Search them. | Files and folders with deassigned tags doesn't appear. |        |                 |
| Assign tags to shared files and files in external storage. Filter them. | Files or folders tagged appear.          |        |                 |
| Enabling encryption and ldap, assign tags using an ldap user luser1, share those files with another ldap user luser2 Filter tags using luser2. | Luser2 can see the tags assigned by luser1. |        |                 |



**Extra** - API Test:

Having files and folders tagged with

1. Create a report xml file for the query body: "report-systemtags.xml"

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<oc:filter-files xmlns:a="DAV:" xmlns:oc="http://owncloud.org/ns" >
        <a:prop>
                <oc:id/>
                <oc:fileid/>
                <oc:permissions/>
                <a:getlastmodified/>
                <a:getetag/>
                <oc:downloadURL/>
                <oc:ddC/>
                <oc:size/>
                <oc:owner-id/>
                <oc:owner-display-name/>
                <oc:size/>
                <oc:checksum />
                <oc:tags />
                <a:quota-used-bytes/>
                <a:quota-available-bytes/>
        </a:prop>
        <oc:filter-rules>
                <oc:systemtag>1</oc:systemtag>
        </oc:filter-rules>
</oc:filter-files>
```

1. Request the REPORT: `curl -i --data-binary "@report-systemtags.xml" -X REPORT -H "Content-Type: text/xml" http://root:admin@localhost/owncloud/remote.php/files/`
   
2. Answer should be like
   
3. ``` xml
   <?xml version="1.0"?>
   <d:multistatus xmlns:d="DAV:" xmlns:s="http://sabredav.org/ns" xmlns:oc="http://owncloud.org/ns">
    <d:response>
     <d:status>HTTP/1.1 200 OK</d:status>
     <d:href>/owncloud/remote.php/files/welcome.txt</d:href>
     <d:propstat>
      <d:prop>
       <oc:id>00000003ockbfur1449k</oc:id>
       <oc:fileid>3</oc:fileid>
       <oc:permissions>RDNVW</oc:permissions>
       <d:getlastmodified>Wed, 03 Feb 2016 19:23:35 GMT</d:getlastmodified>
       <d:getetag>&quot;c0741586516b87b952f00d26c844ca92&quot;</d:getetag>
       <oc:downloadURL></oc:downloadURL>
       <oc:owner-id>root</oc:owner-id>
       <oc:owner-display-name>root</oc:owner-display-name>
       <oc:checksum></oc:checksum>
       <oc:tags/>
      </d:prop>
      <d:status>HTTP/1.1 200 OK</d:status>
     </d:propstat>
     <d:propstat>
      <d:prop>
       <oc:ddC/>
       <oc:size/>
       <d:quota-used-bytes/>
       <d:quota-available-bytes/>
      </d:prop>
      <d:status>HTTP/1.1 404 Not Found</d:status>
     </d:propstat>
    </d:response>
    <d:response>
     <d:status>HTTP/1.1 200 OK</d:status>
     <d:href>/owncloud/remote.php/files/test</d:href>
     <d:propstat>
      <d:prop>
       <oc:id>00000003ockbfur1449k</oc:id>
       <oc:fileid>3</oc:fileid>
       <oc:permissions>RDNVW</oc:permissions>
       <d:getlastmodified>Wed, 03 Feb 2016 19:23:35 GMT</d:getlastmodified>
       <d:getetag>&quot;c0741586516b87b952f00d26c844ca92&quot;</d:getetag>
       <oc:downloadURL></oc:downloadURL>
       <oc:size>1978913</oc:size>
       <oc:owner-id>root</oc:owner-id>
       <oc:owner-display-name>root</oc:owner-display-name>
       <oc:checksum></oc:checksum>
       <oc:tags/>
       <d:quota-used-bytes>1978913</d:quota-used-bytes>
       <d:quota-available-bytes>1070305280</d:quota-available-bytes>
      </d:prop>
      <d:status>HTTP/1.1 200 OK</d:status>
     </d:propstat>
     <d:propstat>
      <d:prop>
       <oc:ddC/>
      </d:prop>
      <d:status>HTTP/1.1 404 Not Found</d:status>
     </d:propstat>
    </d:response>
    <d:response>
     <d:status>HTTP/1.1 200 OK</d:status>
     <d:href>/owncloud/remote.php/files/test/Huoguo.jpg</d:href>
     <d:propstat>
      <d:prop>
       <oc:id>00000003ockbfur1449k</oc:id>
       <oc:fileid>3</oc:fileid>
       <oc:permissions>RDNVW</oc:permissions>
       <d:getlastmodified>Wed, 03 Feb 2016 19:23:35 GMT</d:getlastmodified>
       <d:getetag>&quot;c0741586516b87b952f00d26c844ca92&quot;</d:getetag>
       <oc:downloadURL></oc:downloadURL>
       <oc:size>1978913</oc:size>
       <oc:owner-id>root</oc:owner-id>
       <oc:owner-display-name>root</oc:owner-display-name>
       <oc:checksum></oc:checksum>
       <oc:tags/>
       <d:quota-used-bytes>1978913</d:quota-used-bytes>
       <d:quota-available-bytes>1070305280</d:quota-available-bytes>
      </d:prop>
      <d:status>HTTP/1.1 200 OK</d:status>
     </d:propstat>
     <d:propstat>
      <d:prop>
       <oc:ddC/>
      </d:prop>
      <d:status>HTTP/1.1 404 Not Found</d:status>
     </d:propstat>
    </d:response>
   </d:multistatus>
   ```
   
   ​

