function varargout = Losescreen(varargin)
clear sound
% LOSESCREEN MATLAB code for Losescreen.fig
%      LOSESCREEN, by itself, creates a new LOSESCREEN or raises the existing
%      singleton*.
%
%      H = LOSESCREEN returns the handle to a new LOSESCREEN or the handle to
%      the existing singleton*.
%
%      LOSESCREEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOSESCREEN.M with the given input arguments.
%
%      LOSESCREEN('Property','Value',...) creates a new LOSESCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Losescreen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Losescreen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Losescreen

% Last Modified by GUIDE v2.5 08-Jan-2019 16:42:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Losescreen_OpeningFcn, ...
                   'gui_OutputFcn',  @Losescreen_OutputFcn, ...
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


% --- Executes just before Losescreen is made visible.
function Losescreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Losescreen (see VARARGIN)

% Choose default command line output for Losescreen
handles.output = hObject;

[y, Fs] = audioread('Losescreen.mp3');
sound(y, Fs);

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('losescreen.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Losescreen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Losescreen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound
close (Losescreen)

run Homescreen.m

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound
close all