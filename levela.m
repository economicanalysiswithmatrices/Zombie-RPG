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
%      applied to the GUI before level1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to level1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help level1

% Last Modified by GUIDE v2.5 01-Jan-2019 16:47:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @level1_OpeningFcn, ...
                   'gui_OutputFcn',  @level1_OutputFcn, ...
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


% --- Executes just before level1 is made visible.
function level1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to level1 (see VARARGIN)

% Choose default command line output for level1
handles.output = hObject;

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('prisonbackground.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');





% Update handles structure
guidata(hObject, handles);

% UIWAIT makes level1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = level1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global playerstrength
global zombiestrength
global playerhealth
global zombiehealth
playerhealth=100;
zombiehealth=100;
zombiestrength = 0;


set(handles.playerstrengthtag, 'String', playerstrength);

set(handles.zombiestrengthtag, 'String', zombiestrength);

set(handles.playerhealthtag, 'String', playerhealth);

set(handles.zombiehealthtag, 'String', zombiehealth);



% --- Executes on button press in levelachoicea.
function levelachoicea_Callback(hObject, eventdata, handles)
% hObject    handle to levelachoicea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerhealth
close (levela)
playerhealth = playerhealth + 20
run levelb.m

% --- Executes on button press in levelachoiceb.
function levelachoiceb_Callback(hObject, eventdata, handles)
% hObject    handle to levelachoiceb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zombiehealth
close (levela)
zombiehealth = zombiehealth + 20 
run levelg.m
