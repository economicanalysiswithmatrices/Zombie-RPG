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

% Last Modified by GUIDE v2.5 29-Dec-2018 12:18:27

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
[y,fs]=audioread('knocking.wav'); 
sound(y,fs)
%plays audio file

set(handles.checkonjoeya,'visible','off');
set(handles.checkonjoeyb,'visible','off');
set(handles.backgatea,'visible','off');
set(handles.backgateb,'visible','off');
set(handles.upstairsb,'visible','off');
set(handles.upstairsa,'visible','off');
set(handles.kitchena,'visible','off');
set(handles.kitchenb,'visible','off');

set(handles.textstore,'visible','off');
set(handles.restartbutton,'visible','off');
set(handles.textkitchen,'visible','off');
set(handles.textcheckonjoey,'visible','off');
set(handles.textbackgate,'visible','off');
set(handles.textvet,'visible', 'off');
set(handles.textupstairs,'visible','off');
set(handles.text4Death,'visible','off');
% This sets the pushbuttons and text boxes that are not currently in use, to invisible

% --- Outputs from this function are returned to the command line.
function varargout = Game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in starta.
function starta_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.starta,'visible','off');

set(handles.startb,'visible','off');

set(handles.checkonjoeya,'visible','on');

set(handles.checkonjoeyb,'visible','on');

set(handles.textstart,'visible','off');

set(handles.textcheckonjoey,'visible','on');
[y,fs]=audioread('rain.wav');
sound(y,fs)

% Changes textbox to the next scenario, makes the current buttons
% invisible, makes the new buttons visible
% --- Executes on button press in startb.
function startb_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.starta,'visible','off');

set(handles.startb,'visible','off');

set(handles.backgatea,'visible','on');

set(handles.backgateb,'visible','on');

set(handles.textstart,'visible','off');
set(handles.textbackgate,'visible','on');

% --- Executes on button press in checkonjoeya.
function checkonjoeya_Callback(hObject, eventdata, handles)
% hObject    handle to checkonjoeya (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.healthdisplay, 'string', 'Current Health = 80')
set(handles.textcheckonjoey,'visible','off');
set(handles.textupstairs,'visible','on');
set(handles.checkonjoeya,'visible','off');
set(handles.checkonjoeyb,'visible','off');
set(handles.upstairsa,'visible','on');
set(handles.upstairsb,'visible','on');

[y,fs]=audioread('stairs.wav');
sound(y,fs)
% --- Executes on button press in upstairsb.
function upstairsb_Callback(hObject, eventdata, handles)
% hObject    handle to upstairsb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textupstairs,'visible','off');
set(handles.text4Death,'visible','on');
set(handles.healthdisplay, 'string', 'Current Health = 0')
set(handles.upstairsa,'visible','off');
set(handles.upstairsb,'visible','off');
set(handles.restartbutton,'visible','on');
% --- Executes on button press in restartbutton.
function restartbutton_Callback(hObject, eventdata, handles)
close(Game)
run Game.m

% --- Executes on button press in upstairsa.
function upstairsa_Callback(hObject, eventdata, handles)
% hObject    handle to upstairsa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in backgateb.
function backgateb_Callback(hObject, eventdata, handles)
% hObject    handle to backgateb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textstore,'visible','on');
set(handles.textbackgate,'visible','off');
set(handles.backgatea,'visible','off');
set(handles.backgateb,'visible','off');
set(handles.kitchena,'visible','on');
set(handles.kitchenb,'visible','on');


% --- Executes on button press in backgatea.
function backgatea_Callback(hObject, eventdata, handles)
set(handles.textstart,'string' , 'stage 3ba')
set(handles.textvet,'visible','on');
set(handles.textbackgate,'visible','off');
set(handles.backgatea,'visible','off');
set(handles.backgateb,'visible','off');
% --- Executes on button press in checkonjoeyb.
function checkonjoeyb_Callback(hObject, eventdata, handles)
set(handles.textkitchen,'visible','on');
set(handles.textcheckonjoey,'visible','off');
set(handles.checkonjoeya,'visible','off');
set(handles.checkonjoeyb,'visible','off');

% --- Executes on button press in kitchena.
function kitchena_Callback(hObject, eventdata, handles)


% --- Executes on button press in kitchenb.
function kitchenb_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function healthdisplay_CreateFcn(hObject, eventdata, handles)


