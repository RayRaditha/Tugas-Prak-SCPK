function varargout = LuasVolumeBalok(varargin)
% LUASVOLUMEBALOK MATLAB code for LuasVolumeBalok.fig
%      LUASVOLUMEBALOK, by itself, creates a new LUASVOLUMEBALOK or raises the existing
%      singleton*.
%
%      H = LUASVOLUMEBALOK returns the handle to a new LUASVOLUMEBALOK or the handle to
%      the existing singleton*.
%
%      LUASVOLUMEBALOK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LUASVOLUMEBALOK.M with the given input arguments.
%
%      LUASVOLUMEBALOK('Property','Value',...) creates a new LUASVOLUMEBALOK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LuasVolumeBalok_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LuasVolumeBalok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LuasVolumeBalok

% Last Modified by GUIDE v2.5 07-Apr-2021 15:08:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LuasVolumeBalok_OpeningFcn, ...
                   'gui_OutputFcn',  @LuasVolumeBalok_OutputFcn, ...
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


% --- Executes just before LuasVolumeBalok is made visible.
function LuasVolumeBalok_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LuasVolumeBalok (see VARARGIN)

% Choose default command line output for LuasVolumeBalok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LuasVolumeBalok wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LuasVolumeBalok_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tmbl_reset.
function tmbl_reset_Callback(hObject, eventdata, handles)
% hObject    handle to tmbl_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection=questdlg(['Reset data',' ?'],...
    ['Konfirmasi' '' '...'],...
    'Ya','Batal','Ya');
if strcmp(selection,'Batal')
    return
end
set(handles.hasil, 'String', '');
set(handles.hasil_hitung, 'String', '');
set(handles.panjang, 'String', '');
set(handles.lebar, 'String', '');
set(handles.tinggi, 'String', '');
set(handles.lebar, 'Enable', 'off');
set(handles.tinggi, 'Enable', 'off');
set(handles.volumebalok, 'Enable', 'off');
set(handles.luasbalok, 'Enable', 'off');
set(handles.volumebalok, 'Value', 0);
set(handles.luasbalok, 'Value', 0);

% --- Executes on button press in tmbl_exit.
function tmbl_exit_Callback(hObject, eventdata, handles)
% hObject    handle to tmbl_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection=questdlg(['Keluar dari Aplikasi',' ?'],...
    ['Konfirmasi' '' '...'],...
    'Ya','Batal','Ya');
if strcmp(selection,'Batal')
    return
end
close;


function panjang_Callback(hObject, eventdata, handles)
% hObject    handle to panjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of panjang as text
%        str2double(get(hObject,'String')) returns contents of panjang as a double
panjang = str2double(get(hObject, 'String'));
if isnan(panjang)
    set(handles.lebar,'Enable','off');  
    set(hObject, 'String', '');
    errordlg('Panjang harus diisi dengan angka !!','Input Ulang');
elseif (panjang <= 0)
    set(handles.lebar,'Enable','off');  
    set(hObject, 'String', '');
    errordlg('Panjang tidak boleh nol !!','Input Ulang'); 
elseif isempty(panjang)
    set(handles.lebar,'Enable','off');  
    errordlg('Panjang tidak boleh kosong !!','Input Ulang'); 
else
    set(handles.lebar,'Enable','on');  
end

% --- Executes during object creation, after setting all properties.
function panjang_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lebar_Callback(hObject, eventdata, handles)
% hObject    handle to lebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lebar as text
%        str2double(get(hObject,'String')) returns contents of lebar as a double
lebar = str2double(get(hObject, 'String'));
if isnan(lebar)
    set(handles.tinggi,'Enable','off');  
    set(hObject, 'String', '');
    errordlg('Lebar harus diisi dengan angka !!','Input Ulang');
elseif (lebar <= 0)
    set(handles.tinggi,'Enable','off');  
    set(hObject, 'String', '');
    errordlg('Lebar tidak boleh nol !!','Input Ulang'); 
elseif isempty(lebar)
    set(handles.tinggi,'Enable','off');  
    errordlg('Lebar tidak boleh kosong !!','Input Ulang'); 
else
    set(handles.tinggi,'Enable','on');  
end

% --- Executes during object creation, after setting all properties.
function lebar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tinggi_Callback(hObject, eventdata, handles)
% hObject    handle to tinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tinggi as text
%        str2double(get(hObject,'String')) returns contents of tinggi as a double
tinggi = str2double(get(hObject, 'String'));
if isnan(tinggi)
    set(handles.volumebalok,'Enable','off'); 
    set(handles.luasbalok,'Enable','off'); 
    set(hObject, 'String', '');
    errordlg('Tinggi harus diisi dengan angka !!','Input Ulang');
elseif (tinggi <= 0)
    set(handles.volumebalok,'Enable','off'); 
    set(handles.luasbalok,'Enable','off'); 
    set(hObject, 'String', '');
    errordlg('Tinggi tidak boleh nol !!','Input Ulang'); 
elseif isempty(tinggi)
    set(handles.volumebalok,'Enable','off'); 
    set(handles.luasbalok,'Enable','off');   
    errordlg('Tinggi tidak boleh kosong !!','Input Ulang'); 
else
    set(handles.volumebalok,'Enable','on'); 
    set(handles.luasbalok,'Enable','on');  
end

% --- Executes during object creation, after setting all properties.
function tinggi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in pilih.
function pilih_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in pilih 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=str2num(get(handles.panjang, 'String'));
l=str2num(get(handles.lebar, 'String'));
t=str2num(get(handles.tinggi, 'String'));
luas=2*((p*l)+(p*t)+(l*t));
volume=p*l*t;
if (hObject == handles.luasbalok)
    set(handles.hasil_hitung, 'String', 'Luas Balok');
    set(handles.hasil, 'String', luas);
else
    set(handles.hasil_hitung, 'String', 'Volume Balok');
    set(handles.hasil, 'String', volume);
end

% --------Reset data
function initialize_gui(fig_handle, handles, isreset)
if isfield(handles, 'metricdata') && ~isreset
    return;
end
guidata(handles. LuasVolumeBalok, handles);

% --- Executes on button press in volumebalok.
function volumebalok_Callback(hObject, eventdata, handles)
% hObject    handle to volumebalok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of volumebalok