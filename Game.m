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

% Last Modified by GUIDE v2.5 28-Dec-2018 15:45:43

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


set(handles.pushbutton2aa,'visible','off');
set(handles.pushbutton2ab,'visible','off');
set(handles.pushbutton2ba,'visible','off');
set(handles.pushbutton2bb,'visible','off');
% This sets the pushbuttons for the later stages invisible

% --- Outputs from this function are returned to the command line.
function varargout = Game_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1a.
function pushbutton1a_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.text1,'string' , 'stage 2a')

set(handles.pushbutton1a,'visible','off');

set(handles.pushbutton1b,'visible','off');

set(handles.pushbutton2aa,'visible','on');

set(handles.pushbutton2ab,'visible','on');

% Changes textbox to the next scenario, makes the current buttons
% invisible, makes the new buttons visible
% --- Executes on button press in pushbutton1b.
function pushbutton1b_Callback(hObject, eventdata, handles)
set(handles.healthdisplay, 'string', 'Current Health = 100');

set(handles.text1,'string' , 'stage 2b')

set(handles.pushbutton1a,'visible','off');

set(handles.pushbutton1b,'visible','off');

set(handles.pushbutton2ba,'visible','on');

set(handles.pushbutton2bb,'visible','on');

% --- Executes on button press in pushbutton2aa.
function pushbutton2aa_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2aa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'string' , 'stage 3aa')

% --- Executes on button press in pushbutton2bb.
function pushbutton2bb_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2bb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'string' , 'stage 3bb')

% --- Executes on button press in pushbutton2ba.
function pushbutton2ba_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2ba (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'string' , 'stage 3ba')



% --- Executes on button press in pushbutton2ab.
function pushbutton2ab_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2ab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'string' , 'stage 3ab')
% --- Executes during object creation, after setting all properties.
function healthdisplay_CreateFcn(hObject, eventdata, handles)

% hObject    handle to healthdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



