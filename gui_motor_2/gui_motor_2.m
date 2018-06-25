% This code moves a motor:
% With button F Forward
%			  B Backward
%			  S Stop
% Select: 	COM port    @ line 64
% 			motor/Speed @ line 70

function varargout = gui_motor_2(varargin)
% GUI_MOTOR_2 MATLAB code for gui_motor_2.fig
%      GUI_MOTOR_2, by itself, creates a new GUI_MOTOR_2 or raises the existing
%      singleton*.
%
%      H = GUI_MOTOR_2 returns the handle to a new GUI_MOTOR_2 or the handle to
%      the existing singleton*.
%
%      GUI_MOTOR_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MOTOR_2.M with the given input arguments.
%
%      GUI_MOTOR_2('Property','Value',...) creates a new GUI_MOTOR_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_motor_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_motor_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_motor_2

% Last Modified by GUIDE v2.5 28-Jan-2017 14:22:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_motor_2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_motor_2_OutputFcn, ...
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


% --- Executes just before gui_motor_2 is made visible.
function gui_motor_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_motor_2 (see VARARGIN)

% Choose default command line output for gui_motor_2
handles.output = hObject;

global a;
delete(instrfind('Type', 'serial'));
a=arduino('COM3');  						    % Select Arduino Port
handles.a=a;
handles.a.motorSpeed(1,200);					% Select Motor & Speed <- ***

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_motor_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_motor_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in button_F.
function button_F_Callback(hObject, eventdata, handles)
% hObject    handle to button_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
d=a.analogRead(1);
%if d>200
    handles.a.motorRun(1,'forward');
%     while d>200
%         d=a.analogRead(1);
%         c=num2str(d);
%         set(handles.analog_0,'string',c);
%     end
%     handles.a.motorRun(1,'release');
% end


% --- Executes on button press in button_S.
function button_S_Callback(hObject, eventdata, handles)
% hObject    handle to button_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'release');

% --- Executes on button press in button_B.
function button_B_Callback(hObject, eventdata, handles)
% hObject    handle to button_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'backward');


% --- Executes on button press in button_read.
function button_read_Callback(hObject, eventdata, handles)
% hObject    handle to button_read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
b=a.analogRead(1);
c=num2str(b);
set(handles.analog_0,'string',c);
