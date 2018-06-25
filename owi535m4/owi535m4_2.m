% This code controls 4 motors using a GUI
% Make sure that you are using the correct COM port

function varargout = owi535m4_2(varargin)
% OWI535M4_2 MATLAB code for owi535m4_2.fig
%      OWI535M4_2, by itself, creates a new OWI535M4_2 or raises the existing
%      singleton*.
%
%      H = OWI535M4_2 returns the handle to a new OWI535M4_2 or the handle to
%      the existing singleton*.
%
%      OWI535M4_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OWI535M4_2.M with the given input arguments.
%
%      OWI535M4_2('Property','Value',...) creates a new OWI535M4_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before owi535m4_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to owi535m4_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help owi535m4_2

% Last Modified by GUIDE v2.5 15-Jan-2018 13:17:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @owi535m4_2_OpeningFcn, ...
                   'gui_OutputFcn',  @owi535m4_2_OutputFcn, ...
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


% --- Executes just before owi535m4_2 is made visible.
function owi535m4_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to owi535m4_2 (see VARARGIN)

% Choose default command line output for owi535m4_2
handles.output = hObject;



global a;

delete(instrfind('Type', 'serial'));

%a=arduino('COM4');                          % Select Arduino Port
%handles.a=a;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes owi535m4_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = owi535m4_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% ******************  POPUP MENU  *******************


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global a;
str=get(hObject,'String');
v=get(hObject,'Value');
switch str{v};
    case 'COM 1'
        delete(instrfind('Type', 'serial'));
        a=arduino('COM1');
        handles.a=a;
    case 'COM 2'        
        delete(instrfind('Type', 'serial'));
        a=arduino('COM2');
        handles.a=a;
    case 'COM 3'        
        delete(instrfind('Type', 'serial'));
        a=arduino('COM3');
        handles.a=a;
    case 'COM 4'        
        delete(instrfind('Type', 'serial'));
        a=arduino('COM4');
        handles.a=a;
    case 'COM 5'        
        delete(instrfind('Type', 'serial'));
        a=arduino('COM5');
        handles.a=a;
end
guidata(hObject,handles)

% Set speed (with pwm,0-255)

handles.a.motorSpeed(1,200);
handles.a.motorSpeed(2,200);
handles.a.motorSpeed(3,200);
handles.a.motorSpeed(4,200);



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% ************** BUTTONS  ***********************


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'forward');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'release');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'backward');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(2,'forward');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(2,'release');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(2,'backward');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(3,'backward');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(3,'release');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(3,'forward');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(4,'forward');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(4,'release');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(4,'backward');


% ********************** STOP BUTTON **************************


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.a.motorRun(1,'release');
handles.a.motorRun(2,'release');
handles.a.motorRun(3,'release');
handles.a.motorRun(4,'release');