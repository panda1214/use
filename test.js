var sFolderPath = "D:\\MSG\USE\QHHH";
if (!fso.FolderExists(sFolderPath)) {
    alert("Folder does not exist!");
    return;
}

fh = fso.CreateTextFile(sFolderPath + "\\myXML.xml", true);
//....