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

% Last Modified by GUIDE v2.5 08-Jan-2019 12:26:46

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

[y, Fs] = audioread('Crusade.mp3');
sound(y, Fs);

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
set(handles.texta, 'visible', 'off');
set(handles.textb, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

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
set(handles.texta, 'visible', 'off');
set(handles.textg, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

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
set(handles.textb, 'visible', 'off');
set(handles.textc, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in bb.
function bb_Callback(hObject, eventdata, handles)
% hObject    handle to bb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ba,'visible','off');
set(handles.bb,'visible','off')
set(handles.textb, 'visible', 'off');
set(handles.texth, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ha,'visible','on');
set(handles.hb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in ca.
function ca_Callback(hObject, eventdata, handles)
% hObject    handle to ca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ca,'visible','off');
set(handles.cb,'visible','off')
set(handles.textc, 'visible', 'off');
set(handles.texti, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ia,'visible','on');
set(handles.ib,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

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
set(handles.ca,'visible','off');
set(handles.cb,'visible','off')
set(handles.textc, 'visible', 'off');
set(handles.textd, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run Losescreen.m
end

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
set(handles.textd, 'visible', 'off');
set(handles.texte, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end
% --- Executes on button press in ea.
function ea_Callback(hObject, eventdata, handles)
% hObject    handle to ea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ea,'visible','off');
set(handles.eb,'visible','off')
set(handles.texte, 'visible', 'off');
set(handles.textk, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ka,'visible','on');
set(handles.kb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in fa.
function fa_Callback(hObject, eventdata, handles)
% hObject    handle to fa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.fa,'visible','off');
set(handles.fb,'visible','off')
set(handles.textf, 'visible', 'off');
set(handles.textl, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.la,'visible','on');
set(handles.lb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in db.
function db_Callback(hObject, eventdata, handles)
% hObject    handle to db (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.db,'visible','off');
set(handles.da,'visible','off')
set(handles.textd, 'visible', 'off');
set(handles.textj, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ja,'visible','on');
set(handles.jb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

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
set(handles.texte, 'visible', 'off');
set(handles.textf, 'visible', 'on');
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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in fb.
function fb_Callback(hObject, eventdata, handles)
% hObject    handle to fb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(levelb)
run Winscreen2.m


% --- Executes on button press in ga.
function ga_Callback(hObject, eventdata, handles)
% hObject    handle to ga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ga,'visible','off');
set(handles.gb,'visible','off')
set(handles.textg, 'visible', 'off');
set(handles.textm, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ma,'visible','on');
set(handles.mb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in ma.
function ma_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ma,'visible','off');
set(handles.mb,'visible','off')
set(handles.textm, 'visible', 'off');
set(handles.texts, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.sa,'visible','on');
set(handles.sb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in sa.
function sa_Callback(hObject, eventdata, handles)
% hObject    handle to sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth +20
set(handles.sa,'visible','off');
set(handles.sb,'visible','off')
set(handles.texts, 'visible', 'off');
set(handles.textt, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ta,'visible','on');
set(handles.tb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in ya.
function ya_Callback(hObject, eventdata, handles)
% hObject    handle to ya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ya,'visible','off');
set(handles.yb,'visible','off')
set(handles.texty, 'visible', 'off');
set(handles.textz, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.za,'visible','on');
set(handles.zb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in mb.
function mb_Callback(hObject, eventdata, handles)
% hObject    handle to mb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ma,'visible','off');
set(handles.mb,'visible','off')
set(handles.textm, 'visible', 'off');
set(handles.textn, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.na,'visible','on');
set(handles.nb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in sb.
function sb_Callback(hObject, eventdata, handles)
% hObject    handle to sb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.sa,'visible','off');
set(handles.sb,'visible','off')
set(handles.texts, 'visible', 'off');
set(handles.texty, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ya,'visible','on');
set(handles.yb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in yb.
function yb_Callback(hObject, eventdata, handles)
% hObject    handle to yb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ya,'visible','off');
set(handles.yb,'visible','off')
set(handles.texty, 'visible', 'off');
set(handles.textae, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aea,'visible','on');
set(handles.aeb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in gb.
function gb_Callback(hObject, eventdata, handles)
% hObject    handle to gb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ga,'visible','off');
set(handles.gb,'visible','off')
set(handles.textg, 'visible', 'off');
set(handles.texth, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ha,'visible','on');
set(handles.hb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aea.
function aea_Callback(hObject, eventdata, handles)
% hObject    handle to aea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)
run Losescreen.m

% --- Executes on button press in aeb.
function aeb_Callback(hObject, eventdata, handles)
% hObject    handle to aeb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aea,'visible','off');
set(handles.aeb,'visible','off')
set(handles.textae, 'visible', 'off');
set(handles.textaf, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.afa,'visible','on');
set(handles.afb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in ha.
function ha_Callback(hObject, eventdata, handles)
% hObject    handle to ha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ha,'visible','off');
set(handles.hb,'visible','off')
set(handles.texth, 'visible', 'off');
set(handles.textn, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.na,'visible','on');
set(handles.nb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in na.
function na_Callback(hObject, eventdata, handles)
% hObject    handle to na (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.na,'visible','off');
set(handles.nb,'visible','off')
set(handles.textn, 'visible', 'off');
set(handles.textt, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ta,'visible','on');
set(handles.tb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end
% --- Executes on button press in ta.
function ta_Callback(hObject, eventdata, handles)
% hObject    handle to ta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ta,'visible','off');
set(handles.tb,'visible','off')
set(handles.textt, 'visible', 'off');
set(handles.textu, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ua,'visible','on');
set(handles.ub,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in za.
function za_Callback(hObject, eventdata, handles)
% hObject    handle to za (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.za,'visible','off');
set(handles.zb,'visible','off')
set(handles.textz, 'visible', 'off');
set(handles.textaa, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aaa,'visible','on');
set(handles.aab,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in afa.
function afa_Callback(hObject, eventdata, handles)
% hObject    handle to afa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.afa,'visible','off');
set(handles.afb,'visible','off')
set(handles.textaf, 'visible', 'off');
set(handles.textag, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aga,'visible','on');
set(handles.agb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in ia.
function ia_Callback(hObject, eventdata, handles)
% hObject    handle to ia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ia,'visible','off');
set(handles.ib,'visible','off')
set(handles.texti, 'visible', 'off');
set(handles.texto, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.oa,'visible','on');
set(handles.ob,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in oa.
function oa_Callback(hObject, eventdata, handles)
% hObject    handle to oa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.oa,'visible','off');
set(handles.ob,'visible','off')
set(handles.texto, 'visible', 'off');
set(handles.textp, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.pa,'visible','on');
set(handles.pb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in ua.
function ua_Callback(hObject, eventdata, handles)
% hObject    handle to ua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ua,'visible','off');
set(handles.ub,'visible','off')
set(handles.textu, 'visible', 'off');
set(handles.textv, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.pa,'visible','on');
set(handles.pb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aaa.
function aaa_Callback(hObject, eventdata, handles)
% hObject    handle to aaa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.aaa,'visible','off');
set(handles.aab,'visible','off')
set(handles.textaa, 'visible', 'off');
set(handles.textab, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.oa,'visible','on');
set(handles.ob,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aga.
function aga_Callback(hObject, eventdata, handles)
% hObject    handle to aga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Losescreen.m

% --- Executes on button press in ja.
function ja_Callback(hObject, eventdata, handles)
% hObject    handle to ja (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ja,'visible','off');
set(handles.jb,'visible','off')
set(handles.textj, 'visible', 'off');
set(handles.textp, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.pa,'visible','on');
set(handles.pb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in pa.
function pa_Callback(hObject, eventdata, handles)
% hObject    handle to pa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.pa,'visible','off');
set(handles.pb,'visible','off')
set(handles.textp, 'visible', 'off');
set(handles.textv, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.va,'visible','on');
set(handles.vb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in va.
function va_Callback(hObject, eventdata, handles)
% hObject    handle to va (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.va,'visible','off');
set(handles.vb,'visible','off')
set(handles.textv, 'visible', 'off');
set(handles.textw, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.wa,'visible','on');
set(handles.wb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aba.
function aba_Callback(hObject, eventdata, handles)
% hObject    handle to aba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aba,'visible','off');
set(handles.abb,'visible','off')
set(handles.textab, 'visible', 'off');
set(handles.textac, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aca,'visible','on');
set(handles.acb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aha.
function aha_Callback(hObject, eventdata, handles)
% hObject    handle to aha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aha,'visible','off');
set(handles.ahb,'visible','off')
set(handles.textah, 'visible', 'off');
set(handles.textai, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aia,'visible','on');
set(handles.aib,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in ka.
function ka_Callback(hObject, eventdata, handles)
% hObject    handle to ka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ka,'visible','off');
set(handles.kb,'visible','off')
set(handles.textk, 'visible', 'off');
set(handles.textq, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.qa,'visible','on');
set(handles.qb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in qa.
function qa_Callback(hObject, eventdata, handles)
% hObject    handle to qa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.qa,'visible','off');
set(handles.qb,'visible','off')
set(handles.textq, 'visible', 'off');
set(handles.textr, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ra,'visible','on');
set(handles.rb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in wa.
function wa_Callback(hObject, eventdata, handles)
% hObject    handle to wa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.wa,'visible','off');
set(handles.wb,'visible','off')
set(handles.textw, 'visible', 'off');
set(handles.textac, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aca,'visible','on');
set(handles.acb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aca.
function aca_Callback(hObject, eventdata, handles)
% hObject    handle to aca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aca,'visible','off');
set(handles.acb,'visible','off')
set(handles.textac, 'visible', 'off');
set(handles.textad, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ada,'visible','on');
set(handles.adb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aia.
function aia_Callback(hObject, eventdata, handles)
% hObject    handle to aia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Losescreen.m

% --- Executes on button press in la.
function la_Callback(hObject, eventdata, handles)
% hObject    handle to la (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)
run Winscreen2.m

% --- Executes on button press in ra.
function ra_Callback(hObject, eventdata, handles)
% hObject    handle to ra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ra,'visible','off');
set(handles.rb,'visible','off')
set(handles.textr, 'visible', 'off');
set(handles.textx, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.xa,'visible','on');
set(handles.xb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in xa.
function xa_Callback(hObject, eventdata, handles)
% hObject    handle to xa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Winscreen2.m

% --- Executes on button press in ada.
function ada_Callback(hObject, eventdata, handles)
% hObject    handle to ada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ada,'visible','off');
set(handles.adb,'visible','off')
set(handles.textad, 'visible', 'off');
set(handles.textaj, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aja,'visible','on');
set(handles.ajb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in aja.
function aja_Callback(hObject, eventdata, handles)
% hObject    handle to aja (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Losescreen.m

% --- Executes on button press in hb.
function hb_Callback(hObject, eventdata, handles)
% hObject    handle to hb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ha,'visible','off');
set(handles.hb,'visible','off')
set(handles.texth, 'visible', 'off');
set(handles.texti, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ia,'visible','on');
set(handles.ib,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in nb.
function nb_Callback(hObject, eventdata, handles)
% hObject    handle to nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.na,'visible','off');
set(handles.nb,'visible','off')
set(handles.textn, 'visible', 'off');
set(handles.texto, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.oa,'visible','on');
set(handles.ob,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in tb.
function tb_Callback(hObject, eventdata, handles)
% hObject    handle to tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.tb,'visible','off');
set(handles.ta,'visible','off')
set(handles.textg, 'visible', 'off');
set(handles.textm, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.za,'visible','on');
set(handles.zb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end
% --- Executes on button press in zb.
function zb_Callback(hObject, eventdata, handles)
% hObject    handle to zb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.za,'visible','off');
set(handles.zb,'visible','off')
set(handles.textz, 'visible', 'off');
set(handles.textaf, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.afa,'visible','on');
set(handles.afb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in afb.
function afb_Callback(hObject, eventdata, handles)
% hObject    handle to afb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(levelb)
run Losescreen.m

% --- Executes on button press in ib.
function ib_Callback(hObject, eventdata, handles)
% hObject    handle to ib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ia,'visible','off');
set(handles.ib,'visible','off')
set(handles.texti, 'visible', 'off');
set(handles.textj, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ja,'visible','on');
set(handles.jb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in ob.
function ob_Callback(hObject, eventdata, handles)
% hObject    handle to ob (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.oa,'visible','off');
set(handles.ob,'visible','off')
set(handles.texto, 'visible', 'off');
set(handles.textu, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ua,'visible','on');
set(handles.ub,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in ub.
function ub_Callback(hObject, eventdata, handles)
% hObject    handle to ub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.ua,'visible','off');
set(handles.ub,'visible','off')
set(handles.textu, 'visible', 'off');
set(handles.textaa, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aaa,'visible','on');
set(handles.aab,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in aab.
function aab_Callback(hObject, eventdata, handles)
% hObject    handle to aab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aab,'visible','off');
set(handles.aaa,'visible','off')
set(handles.textaa, 'visible', 'off');
set(handles.textab, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aba,'visible','on');
set(handles.abb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in agb.
function agb_Callback(hObject, eventdata, handles)
% hObject    handle to agb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aga,'visible','off');
set(handles.agb,'visible','off')
set(handles.textag, 'visible', 'off');
set(handles.textah, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aha,'visible','on');
set(handles.ahb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in ahb.
function ahb_Callback(hObject, eventdata, handles)
% hObject    handle to ahb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Losescreen.m

% --- Executes on button press in abb.
function abb_Callback(hObject, eventdata, handles)
% hObject    handle to abb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.aba,'visible','off');
set(handles.abb,'visible','off')
set(handles.textab, 'visible', 'off');
set(handles.textah, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aha,'visible','on');
set(handles.ahb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in vb.
function vb_Callback(hObject, eventdata, handles)
% hObject    handle to vb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.va,'visible','off');
set(handles.vb,'visible','off')
set(handles.textv, 'visible', 'off');
set(handles.textab, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aba,'visible','on');
set(handles.abb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in pb.
function pb_Callback(hObject, eventdata, handles)
% hObject    handle to pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.pa,'visible','off');
set(handles.pb,'visible','off')
set(handles.textp, 'visible', 'off');
set(handles.textq, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.qa,'visible','on');
set(handles.qb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in jb.
function jb_Callback(hObject, eventdata, handles)
% hObject    handle to jb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ja,'visible','off');
set(handles.jb,'visible','off')
set(handles.textj, 'visible', 'off');
set(handles.textk, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ka,'visible','on');
set(handles.kb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in kb.
function kb_Callback(hObject, eventdata, handles)
% hObject    handle to kb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.ka,'visible','off');
set(handles.kb,'visible','off')
set(handles.textk, 'visible', 'off');
set(handles.textl, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.la,'visible','on');
set(handles.lb,'visible','on');

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

if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end

% --- Executes on button press in qb.
function qb_Callback(hObject, eventdata, handles)
% hObject    handle to qb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.qa,'visible','off');
set(handles.qb,'visible','off')
set(handles.textq, 'visible', 'off');
set(handles.textw, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.wa,'visible','on');
set(handles.wb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in wb.
function wb_Callback(hObject, eventdata, handles)
% hObject    handle to wb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.wa,'visible','off');
set(handles.wb,'visible','off')
set(handles.textw, 'visible', 'off');
set(handles.textx, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.xa,'visible','on');
set(handles.xb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in acb.
function acb_Callback(hObject, eventdata, handles)
% hObject    handle to acb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.aca,'visible','off');
set(handles.acb,'visible','off')
set(handles.textac, 'visible', 'off');
set(handles.texto, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aia,'visible','on');
set(handles.aib,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in aib.
function aib_Callback(hObject, eventdata, handles)
% hObject    handle to aib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
playerhealth = playerhealth + 20
set(handles.aia,'visible','off');
set(handles.aib,'visible','off')
set(handles.textai, 'visible', 'off');
set(handles.textaj, 'visible', 'on');
set(handles.correctchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.aja,'visible','on');
set(handles.ajb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end



% --- Executes on button press in ajb.
function ajb_Callback(hObject, eventdata, handles)
% hObject    handle to ajb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Losescreen.m

% --- Executes on button press in adb.
function adb_Callback(hObject, eventdata, handles)
% hObject    handle to adb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)

run Winscreen2.m

% --- Executes on button press in xb.
function xb_Callback(hObject, eventdata, handles)
% hObject    handle to xb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.xa,'visible','off');
set(handles.xb,'visible','off')
set(handles.textx, 'visible', 'off');
set(handles.textad, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ada,'visible','on');
set(handles.adb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end


% --- Executes on button press in rb.
function rb_Callback(hObject, eventdata, handles)
% hObject    handle to rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close (levelb)
run Winscreen2.m

% --- Executes on button press in lb.
function lb_Callback(hObject, eventdata, handles)
% hObject    handle to lb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.equalattack, 'visible' , 'off');
set(handles.zombiewins,'visible','off');
set(handles.playerwins,'visible','off');
global zombiehealth
global playerhealth
global playerstrength
zombiehealth = zombiehealth + 20
set(handles.la,'visible','off');
set(handles.lb,'visible','off')
set(handles.textl, 'visible', 'off');
set(handles.textr, 'visible', 'on');
set(handles.incorrectchoice, 'visible', 'on')
set(handles.yourattack,'visible','on');
set(handles.zombieattack,'visible','on');
set(handles.zombieroll,'visible','on');
set(handles.playerroll,'visible','on');
set(handles.ra,'visible','on');
set(handles.rb,'visible','on');
 
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
 
if zombiehealth == 0
  close(levelb)
  run Winscreen2.m
elseif playerhealth ==0
    close(levelb)
    run losescreen.m
end
