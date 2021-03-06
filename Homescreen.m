function varargout = Homescreen(varargin)
% Homescreen MATLAB code for Homescreen.fig
%     Homescreen, by itself, creates a new Homescreen or raises the existing
%      singleton*.
%
%      H = Homescreen returns the handle to a new Homescreen or the handle to
%      the existing singleton*.
%
%      Homescreen('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Homescreen.M with the given input arguments.
%
%     Homescreen('Property','Value',...) creates a new Homescreen or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Homescreen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Homescreen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Homescreen

% Last Modified by GUIDE v2.5 08-Jan-2019 17:08:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Homescreen_OpeningFcn, ...
                   'gui_OutputFcn',  @Homescreen_OutputFcn, ...
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


% --- Executes just before Homescreen is made visible.
function Homescreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Homescreen (see VARARGIN)

% Choose default command line output for Homescreen
handles.output = hObject;

[y, Fs] = audioread('Homescreen.mp3');
sound(y, Fs);

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('Background.jpeg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

set(handles.pbeasy,'visible','off');
set(handles.pbmedium,'visible','off');
set(handles.pbhard,'visible','off');


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Homescreen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Homescreen_OutputFcn(hObject, eventdata, handles) 
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
set(handles.pbeasy,'visible','on');
set(handles.pbmedium,'visible','on');
set(handles.pbhard,'visible','on');

set(handles.pushbutton1,'visible','off');
set(handles.pushbutton2,'visible','off');
set(handles.pushbutton3,'visible','off');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run howtoplay.m

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound
close all
% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pbeasy.
function pbeasy_Callback(hObject, eventdata, handles)
% hObject    handle to pbeasy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerstrength 
playerstrength = 0;

playerstrength = playerstrength + 1;
clear sound
close (Homescreen)
run levelb.m

% --- Executes on button press in pbmedium.
function pbmedium_Callback(hObject, eventdata, handles)
% hObject    handle to pbmedium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerstrength 
playerstrength = 0;

playerstrength = playerstrength + 0;
clear sound
close (Homescreen)
run levelb.m

% --- Executes on button press in pbhard.
function pbhard_Callback(hObject, eventdata, handles)
% hObject    handle to pbhard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global playerstrength 
playerstrength = 0

playerstrength = playerstrength -1
clear sound

close (Homescreen)
run levelb.m
