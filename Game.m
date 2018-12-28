function varargout = Game(varargin)
% GAME MATLAB code for Game.fig
%      GAME, by itself, creates a new GAME or raises the existing
%      singleton*.
%
%      H = GAME returns the handle to a new GAME or the handle to
%      the existing singleton*.
%
%      GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME.M with the given input arguments.
%
%      GAME('Property','Value',...) creates a new GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Game_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Game_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Game

% Last Modified by GUIDE v2.5 01-Dec-2018 17:45:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Game_OpeningFcn, ...
                   'gui_OutputFcn',  @Game_OutputFcn, ...
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


% --- Executes just before Game is made visible.
function Game_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Game (see VARARGIN)

% Choose default command line output for Game
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.text1,'string' , 'stage 2a')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.text1,'string' , 'stage 2b')


% --- Executes during object creation, after setting all properties.
function healthdisplay_CreateFcn(hObject, eventdata, handles)

% hObject    handle to healthdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
