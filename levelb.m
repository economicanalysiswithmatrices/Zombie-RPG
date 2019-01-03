function varargout = level1(varargin)
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

% Last Modified by GUIDE v2.5 03-Jan-2019 14:33:44

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
% hObject    handle to figure
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
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global playerstrength
global zombiestrength
global playerhealth;
global zombiehealth
zombiestrength = 0;
z = zombiehealth
p = playerhealth

set(handles.playerstrengthtag, 'String', p);

set(handles.zombiestrengthtag, 'String', zombiestrength);

set(handles.playerhealthtag, 'String', p);
set(handles.zombiehealthtag, 'String', z);

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


% --- Executes on button press in choicea.
function choicea_Callback(hObject, eventdata, handles)
% hObject    handle to choicea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zombiehealth
close (levelb)
zombiehealth = zombiehealth + 20 
run levelh.m



% --- Executes on button press in choiceb.
function choiceb_Callback(hObject, eventdata, handles)
% hObject    handle to choiceb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerhealth
close (levelb)
playerhealth = playerhealth + 20
run levelc.m
