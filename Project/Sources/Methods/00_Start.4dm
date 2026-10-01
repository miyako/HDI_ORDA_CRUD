//%attributes = {}
#DECLARE($params : Object)

var $splashWindowTitle : Text
$splashWindowTitle:=""

var $dataClass; $project; $path : Text
var $i; $window; $x; $y; $bottom; $right : Integer
var $options : Object

If (Count parameters=0)
	
	For each ($dataClass; ds)
		If (ds[$dataClass].getCount()=0)
			$path:=File("/RESOURCES/"+$dataClass+".4ie").platformPath
			If (Test path name($path)=Is a document)
				$project:=File("/RESOURCES/"+$dataClass+".4si").getText()
				IMPORT DATA($path; $project)
			End if 
		End if 
	End for each 
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$splashWindowTitle)
			GET WINDOW RECT($x; $y; $right; $bottom; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $right; $bottom; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	SET MENU BAR(1)
	
	$options:=New object
	$options.title:=Localized string("HDI_Title")
	$options.blog:="blog.4d.com"
	$options.info:=Localized string("HDI_Info")
	$options.minimumVersion:="1700"  // 1650 means 16R5   1601 means 16.1 (do not use !)
	//$options.license:=...  // uncomment if a license is needed
	
	$window:=Open form window("HDI"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE($splashWindowTitle; $window)
	DIALOG("HDI"; $options; *)
	
End if 
