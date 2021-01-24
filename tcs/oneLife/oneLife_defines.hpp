////////////////
//Base Classes//
////////////////

class OneLifeRscText
{
	access = 0;
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	linespacing = 1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	shadow = 2;
	font = "EtelkaMonospacePro";
	SizeEx = 0.03;
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
};

class OneLifeRscPicture
{
	access = 0;
	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Bitstream";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class OneLifeRscButton
{
	access = 0;
	type = CT_BUTTON;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0,0,0,0};
	colorBackground[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0.0,0};
	colorBackgroundActive[] = {0,0,0,1};
	colorFocused[] = {0.25,0.25,0.25,0.5};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"",0,1};
	soundPush[] = {"",0,0};
	soundClick[] = {"",0,1};
	soundEscape[] = {"",0,1};
	style = ST_CENTER;
	x = 0;
	y = 0;
	w = 0.055589;
	h = 0.039216;
	shadow = 0;
	font = "EtelkaMonospacePro";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class OneLifeRscFrame
{
	type = CT_STATIC;
	idc = -1;
	style = ST_FRAME;
	shadow = 0;
	colorBackground[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	font = "EtelkaMonospacePro";
	sizeEx = 0.03;
	text = "";
};

class OneLifeBOX
{
	type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	shadow = 2;
	colorText[] = {1,1,1,1};
	font = "Bitstream";
	sizeEx = 0.02;
	colorBackground[] = { 0.1,0.1,0.1, 0.6 }; 
	text = ""; 
};