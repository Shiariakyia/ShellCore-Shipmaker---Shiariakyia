// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_special(x, y, text, font, color, vspace, max_width, fullalign, iconsprite, mode, halign, valign){
	
argument0=x
argument1=y
argument2=text
argument3=font
argument4=color
argument5=vspace
argument6=max_width
argument7=fullalign
argument8=iconsprite
argument9=mode
argument10=halign
argument11=valign


// script draw_text_special_modified

/*
argument0=x
argument1=y
argument2=text
argument3=font
argument4=color
argument5=vertical spacing (-1 default)
argument6=max width (-1 default)
argument7=full align
argument8=icon sprite resource (-1 for none)
argument9: 0= draw text, 1= return text width, 2= return text height
argument10: 0= align text left, 1= align text center, 2= align text right
argument11: 0= align text top, 1= align text middle, 2= align text bottom

special characters:
\uE00x draw a symbol of a symbol spriteset (argument8) with subimage x
\uFrgbtext/ changes color to 12-bit RGB value for text
*/

var __x = argument0;
var __y = argument1;
var __text = argument2;
var __font = argument3;
var __color = argument4;
var __v_spacing = argument5;
var __max_width = argument6;
var __full_align = argument7;
var __spr_icon = argument8;
var __mode = argument9;
var __h_alignment = argument10;
var __v_alignment = argument11;

var list_char;list_char=ds_list_create();
var list_line;list_line=ds_list_create(); //list members are other lists containing the line's characters
var list_alignmentapplies;list_alignmentapplies=ds_list_create();
var list_linewidth;list_linewidth=ds_list_create();
var i,j,k,m,p,t,z,c,a,changeline;
var cred,cgreen,cblue;
var numspaces;
var forcealign;
var symbolsize;
var txtwidth;txtwidth=__max_width;
if __max_width=-1 then txtwidth=99999;
var tspac;tspac=__v_spacing;
var wordspace;
var spacewidth;
var diesiwidth;
var offx,offy;
var strlen;strlen=string_length(__text); //char length of text

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(__font);
symbolsize=string_height("0");
if __v_spacing=-1 then tspac=symbolsize;
spacewidth=string_width(" ");
diesiwidth=string_width("M");
//insert all chars into the list and transform symbols
i=0;
do
{
i+=1;
k=0;
if (ord(string_char_at(__text,i))&$F000)=$E000 then // symbol
{
ds_list_add(list_char,"sym"+string((ord(string_char_at(__text,i))&$FFF)));
k=1; //special symbol found
}
else if (ord(string_char_at(__text,i))&$F000)=$F000 then // begin color
{
var __r = ((ord(string_char_at(__text,i))&$0F00)>>4);
var __g = (ord(string_char_at(__text,i))&$00F0);
var __b = ((ord(string_char_at(__text,i))&$000F)<<4);
ds_list_add(list_char,"col"+string(__r)+","+string(__g)+","+string(__b));
k=1; //special symbol found
}
else if string_char_at(__text,i)="/" then // end color
{
ds_list_add(list_char,"col"+string(color_get_red(__color))+","+string(color_get_green(__color))+","+string(color_get_blue(__color)));
k=1;  //special symbol found
}
if k=0 then ds_list_add(list_char,string_char_at(__text,i));
}
until i=strlen;

//create lines
i=-1;
t=-1; //tracks start of line relative to list_char
j=0; //text width
changeline=0; //if line changes then it is set to 1
do
{
i+=1;
k=ds_list_find_value(list_char,i);
if string_length(k)=1 then j+=string_width(k) else {if string_copy(k,1,3)="sym" then j+=symbolsize;if string_copy(k,1,3)="pr\n" then j+=diesiwidth;}

if k<>"\n" then
{
    if j>=txtwidth then
    {
    changeline=1;forcealign=__full_align;
    i+=1;m=j;do
    {
    i+=-1;
    z=ds_list_find_value(list_char,i);
    if string_length(z)=1 then m+=-string_width(z) else {if string_copy(k,1,3)="sym" then m+=-symbolsize;if string_copy(k,1,3)="pr\n" then m+=-diesiwidth;}
    }
    until ds_list_find_value(list_char,i)=" ";
    ds_list_add(list_linewidth,m);
    }
}
else
{
    changeline=1;forcealign=false;ds_list_add(list_linewidth,j);
}

    if changeline=1 then //line change
    {
    j=0; //text width resets to 0
    changeline=0; //line change resets to 0
    p=ds_list_create();
    ds_list_add(list_line,p);
    ds_list_add(list_alignmentapplies,forcealign);
        repeat i-t
        {
        t+=1;
        ds_list_add(p,ds_list_find_value(list_char,t));
        }
    }
}
until i=ds_list_size(list_char)-1;

//add last line
p=ds_list_create();
ds_list_add(list_line,p);
ds_list_add(list_alignmentapplies,false);
repeat i-t+1
{
t+=1;
ds_list_add(p,ds_list_find_value(list_char,t));
}
ds_list_add(list_linewidth,j);

switch __mode
{
case 0: //draw text normally
{

break;
}

case 1: //return width
{
var list_linewidth_orig;list_linewidth_orig=ds_list_create();
ds_list_copy(list_linewidth_orig,list_linewidth);
ds_list_sort(list_linewidth,0);
var whereismax;whereismax=ds_list_find_index(list_linewidth_orig,ds_list_find_value(list_linewidth,0));
j=ds_list_find_value(list_linewidth,0);
i=-1;repeat ds_list_size(list_line) {i+=1;if ds_list_find_value(list_alignmentapplies,i)=1 then {j=__max_width;break;}}

ds_list_destroy(list_linewidth_orig);

ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
return j;
break;
}

case 2:  //return height
{
j=ds_list_size(list_line)*tspac;

ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
return j;
break;
}
}

//draw text
draw_set_color(__color);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
j=-1;
k=0;
a=0; //because wordspace=floor((txtwidth-c)/numspaces),due to the floor() some space will be lost. 'a' stores that extra space.
p=ds_list_find_value(list_line,i);
wordspace=spacewidth;
switch __h_alignment
{
case 0:{offx=0;break;}
case 1:{offx=-round(ds_list_find_value(list_linewidth,i)/2);break;}
case 2:{offx=-ds_list_find_value(list_linewidth,i);break;}
}

switch __v_alignment
{
case 0:{offy=0;break;}
case 1:{offy=-round(0.5*ds_list_size(list_line)*tspac);break;}
case 2:{offy=-ds_list_size(list_line)*tspac;break;}
}

if __full_align=1 then //find number of spaces in line
{
if ds_list_size(list_line)>1 then
{
if ds_list_find_value(list_alignmentapplies,i)=true then
{
numspaces=0;t=-1;c=0;
repeat ds_list_size(p)-1
{
t+=1;
m=ds_list_find_value(p,t);    if(!is_string(m)){ m=""; }
if string_length(m)=1 then {if m<>" " then c+=string_width(m) else numspaces+=1;} else {if string_copy(m,1,3)="sym" then c+=symbolsize;if string_copy(m,1,3)="pr\n" then c+=diesiwidth;}
}
if numspaces>0 then
{
wordspace=floor((txtwidth-c)/numspaces);
a=txtwidth-c-numspaces*wordspace;
}
}
}
switch __h_alignment
{
case 0:{offx=0;break;}
case 1:{offx=-round((__max_width)/2);break;}
case 2:{offx=-__max_width;break;}
}
}

    repeat ds_list_size(p)
    {
    j+=1;
    m=ds_list_find_value(p,j);    if(!is_string(m)){ m=""; }
        if string_length(m)=1 then
        {
        draw_text(__x+k+offx,__y+offy+tspac*i,m);
        if m=" " then {k+=wordspace;if a>0 then {a+=-1;k+=1;}} else k+=string_width(m);
        }
        else
        {
            if string_copy(m,1,3)="col" then
            {
            t=3;z=3;do z+=1 until string_char_at(m,z)=",";cred=string_copy(m,t+1,z-t-1);z+=1;t=z;
            do z+=1 until string_char_at(m,z)=",";cgreen=string_copy(m,t,z-t);t=z;
            cblue=string_copy(m,t+1,string_length(m)-z);
            draw_set_color(make_color_rgb(real(cred),real(cgreen),real(cblue)));
            }
      
            if string_copy(m,1,3)="sym" then
            {
            draw_sprite_ext(__spr_icon,real(string_digits(m)),__x+k+offx+symbolsize/2,__y+offy+tspac*i+(symbolsize/2),symbolsize/sprite_get_width(__spr_icon),symbolsize/sprite_get_width(__spr_icon),0,c_white,1);
            k+=symbolsize;
            }
      
            if string_copy(m,1,3)="pr\n" then
            {
            draw_text(__x+k+offx,__y+offy+tspac*i,"#");
            k+=diesiwidth;
            }
        }
    }
}


ds_list_destroy(list_char);
i=-1;
repeat ds_list_size(list_line)
{
i+=1;
ds_list_destroy((ds_list_find_value(list_line,i)));
}
ds_list_destroy(list_line);
ds_list_destroy(list_alignmentapplies);
ds_list_destroy(list_linewidth);
}