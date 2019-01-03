function varargout = Game2(varargin)
% GAME2 MATLAB code for Game2.fig
%      GAME2, by itself, creates a new GAME2 or raises the existing
%      singleton*.
%
%      H = GAME2 returns the handle to a new GAME2 or the handle to
%      the existing singleton*.
%
%      GAME2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME2.M with the given input arguments.
%
%      GAME2('Property','Value',...) creates a new GAME2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Game2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Game2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Game2

% Last Modified by GUIDE v2.5 30-Dec-2018 16:10:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Game2_OpeningFcn, ...
                   'gui_OutputFcn',  @Game2_OutputFcn, ...
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


% --- Executes just before Game2 is made visible.
function Game2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Game2 (see VARARGIN)

% Choose default command line output for Game2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Game2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Game2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

playerhealth=100;
zombiehealth=100;

set(handles.playerhealthtag, 'String', playerhealth);

set(handles.zombiehealthtag, 'String', zombiehealth);


playerstrength = randi(6) ;
%playerstrengthtext = sprintf('Strength = %d', playerstrength)
set(handles.playerstrengthtag, 'String', playerstrength);

zombiestrength = randi(6) ;
%zombiestrengthtext = sprintf('Strength = %d', playerstrength)
set(handles.zombiestrengthtag, 'String', zombiestrength);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
playerstrength = playerstrength +1

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
