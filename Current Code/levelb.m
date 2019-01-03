function varargout = levelb(varargin)
% LEVEL1 MATLAB code for level1.fig
%      LEVEL1, by itself, creates a new LEVEL1 or raises the existing
%      singleton*.
%
%      H = LEVEL1 returns the handle to a new LEVEL1 or the handle to
%      the existing singleton*.
%
%      LEVEL1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEVEL1.M with the given input arguments.
%
%      LEVEL1('Property','Value',...) creates a new LEVEL1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Level2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Level2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Level2

% Last Modified by GUIDE v2.5 03-Jan-2019 17:51:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Level2_OpeningFcn, ...
                   'gui_OutputFcn',  @Level2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Level2 is made visible.
function Level2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure1
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Level2 (see VARARGIN)

% Choose default command line output for Level2
handles.output = hObject;

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('prisonbackground.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

set(handles.playerwins,'visible','off');
set(handles.zombiewins,'visible','off');



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Level2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Level2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure1
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global playerstrength
global zombiestrength
global playerhealth;
global zombiehealth
playerhealth = 100
zombiehealth = 100
zombiestrength = 0;


set(handles.playerstrengthtag, 'String', playerstrength);

set(handles.zombiestrengthtag, 'String', zombiestrength);

set(handles.playerhealthtag, 'String', playerhealth);
set(handles.zombiehealthtag, 'String', zombiehealth);


% --- Executes on button press in aa.
function aa_Callback(hObject, eventdata, handles)
% hObject    handle to aa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aa,'visible','off');
set(handles.ab,'visible','off')
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ba,'visible','on');
set(handles.bb,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);


% --- Executes on button press in ab.
function ab_Callback(hObject, eventdata, handles)
% hObject    handle to ab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ab,'visible','off');
set(handles.aa,'visible','off')
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ga,'visible','on');
set(handles.gb,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);


% --- Executes on button press in ba.
function ba_Callback(hObject, eventdata, handles)
% hObject    handle to ba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.equalattack, 'visible' , 'off');
 set(handles.zombiewins,'visible','off');
 set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ba,'visible','off');
set(handles.bb,'visible','off')
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ca,'visible','on');
set(handles.cb,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);

% --- Executes on button press in bb.
function bb_Callback(hObject, eventdata, handles)
% hObject    handle to bb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ca.
function ca_Callback(hObject, eventdata, handles)
% hObject    handle to ca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cb.
function cb_Callback(hObject, eventdata, handles)
% hObject    handle to cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 set(handles.equalattack, 'visible' , 'off');
 set(handles.zombiewins,'visible','off');
 set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.cb,'visible','off');
set(handles.ca,'visible','off')
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.da,'visible','on');
set(handles.db,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);


% --- Executes on button press in da.
function da_Callback(hObject, eventdata, handles)
% hObject    handle to da (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
 set(handles.zombiewins,'visible','off');
 set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.da,'visible','off');
set(handles.db,'visible','off')
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ea,'visible','on');
set(handles.eb,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);

% --- Executes on button press in ea.
function ea_Callback(hObject, eventdata, handles)
% hObject    handle to ea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fa.
function fa_Callback(hObject, eventdata, handles)
% hObject    handle to fa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in db.
function db_Callback(hObject, eventdata, handles)
% hObject    handle to db (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in eb.
function eb_Callback(hObject, eventdata, handles)
% hObject    handle to eb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
 set(handles.zombiewins,'visible','off');
 set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ea,'visible','off');
set(handles.eb,'visible','off')
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.fa,'visible','on');
set(handles.fb,'visible','on');

playeroutcome = randi(6) + playerstrength
zombieoutcome = randi(6)

set(handles.playerroll, 'String', playeroutcome);
set(handles.zombieroll, 'String', zombieoutcome);

if playeroutcome > zombieoutcome
    zombiehealth = zombiehealth - 20
    set(handles.playerwins,'visible','on');

elseif playeroutcome < zombieoutcome
    playerhealth = playerhealth -20
set(handles.zombiewins,'visible','on');
elseif playeroutcome == zombieoutcome
    set(handles.equalattack, 'visible' , 'on');
else
end
set(handles.zombiehealthtag, 'String', zombiehealth);
set(handles.playerhealthtag, 'String', playerhealth);

% --- Executes on button press in fb.
function fb_Callback(hObject, eventdata, handles)
% hObject    handle to fb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(levelb)
run winningscreen.m


% --- Executes on button press in ga.
function ga_Callback(hObject, eventdata, handles)
% hObject    handle to ga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ma.
function ma_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sa.
function sa_Callback(hObject, eventdata, handles)
% hObject    handle to sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ya.
function ya_Callback(hObject, eventdata, handles)
% hObject    handle to ya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mb.
function mb_Callback(hObject, eventdata, handles)
% hObject    handle to mb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in sb.
function sb_Callback(hObject, eventdata, handles)
% hObject    handle to sb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in yb.
function yb_Callback(hObject, eventdata, handles)
% hObject    handle to yb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gb.
function gb_Callback(hObject, eventdata, handles)
% hObject    handle to gb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
