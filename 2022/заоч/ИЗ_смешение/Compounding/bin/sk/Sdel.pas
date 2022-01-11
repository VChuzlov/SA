unit Sdel;

interface

uses
  SysUtils;

function ClearDirectory(Path:string):boolean;

implementation

function ClearDirectory(Path:string):boolean;
var FS:TSearchRec;
    F:File;
    Done:boolean;
    SubDir:boolean;
begin
Done:=True;
SubDir:=True;
If FindFirst(Path+'\*.*',faAnyFile,FS)=0 then
 Repeat
 If (FS.Attr xor faDirectory)=0 then Continue;
 If (Fs.Name='.') or (Fs.Name='..') then continue;
 try
 FileSetAttr(Path+'\'+FS.Name,0);
 DeleteFile(Path+'\'+FS.Name);
{ AssignFile(F,Path+'\'+FS.Name);
 Erase(F);}
 except
 Done:=false;
 end;
 Until FindNext(FS)<>0;
FindClose(FS);
If FindFirst(Path+'\*.*',faAnyFile,FS)=0 then
 Repeat
  If FindFirst(Path+'\*.*',faDirectory,FS)=0 then
  begin
   If (Fs.Name='.') or (Fs.Name='..') then continue;
   try
   Done:=ClearDirectory(Path+'\'+FS.Name) and Done;
   except
   Done:=False;
   end;
  end; 
 Until FindNext(FS)=0;
FindClose(FS);
If Done then
  try
  RemoveDir(Path);
  Result:=true;
  except Result:=False end;

end;

end.
