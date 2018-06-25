classdef owiGui < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                 matlab.ui.Figure
        ForwardButton_1          matlab.ui.control.Button
        ReleaseButton_1          matlab.ui.control.Button
        BackwardButton_1         matlab.ui.control.Button
        ForwardButton_2          matlab.ui.control.Button
        ReleaseButton_2          matlab.ui.control.Button
        BackwardButton_2         matlab.ui.control.Button
        ForwardButton_3          matlab.ui.control.Button
        ReleaseButton_3          matlab.ui.control.Button
        BackwardButton_3         matlab.ui.control.Button
        RightButton              matlab.ui.control.Button
        ReleaseButton_4          matlab.ui.control.Button
        LeftButton               matlab.ui.control.Button
        ROBOTARMOWI535Label      matlab.ui.control.Label
        SelectPortDropDownLabel  matlab.ui.control.Label
        SelectPortDropDown       matlab.ui.control.DropDown
        Motor1Label              matlab.ui.control.Label
        Motor2Label              matlab.ui.control.Label
        Motor3Label              matlab.ui.control.Label
        Motor4Label              matlab.ui.control.Label
    end

    methods (Access = private)
        
        % Value changed function: SelectPortDropDown
        function SelectPortDropDownValueChanged(app, event)
            %value = app.SelectPortDropDown.Value;
            global a;
            a=arduino('COM3');                          % Select Arduino Port
            %handles.a=a;
        end     
        
        

        % Button pushed function: ForwardButton_1
        function ForwardButton_1Pushed(app, event)
            global a;
            handles.a.motorRun(1,'forward');
        end

        % Button pushed function: ForwardButton_2
        function ForwardButton_2Pushed(app, event)
            global a;
            handles.a.motorRun(2,'forward');
        end

        % Button pushed function: ForwardButton_3
        function ForwardButton_3Pushed(app, event)
            global a;
            handles.a.motorRun(3,'forward');
        end

        % Button pushed function: RightButton
        function RightButtonPushed(app, event)
            global a;
            handles.a.motorRun(4,'forward');
        end

        % Button pushed function: BackwardButton_1
        function BackwardButton_1Pushed(app, event)
            global a;
            handles.a.motorRun(1,'backward');
        end

        % Button pushed function: BackwardButton_2
        function BackwardButton_2Pushed(app, event)
            global a;
            handles.a.motorRun(2,'backward');
        end

        % Button pushed function: BackwardButton_3
        function BackwardButton_3Pushed(app, event)
            global a;
            handles.a.motorRun(3,'backward');
        end

        % Button pushed function: LeftButton
        function LeftButtonPushed(app, event)
            global a;
            handles.a.motorRun(4,'backward');
        end

        % Button pushed function: ReleaseButton_1
        function ReleaseButton_1Pushed(app, event)
            global a;
            handles.a.motorRun(1,'release');
        end

        % Button pushed function: ReleaseButton_2
        function ReleaseButton_2Pushed(app, event)
            global a;
            handles.a.motorRun(2,'release');
        end

        % Button pushed function: ReleaseButton_3
        function ReleaseButton_3Pushed(app, event)
            global a;
            handles.a.motorRun(3,'release');
        end

        % Button pushed function: ReleaseButton_4
        function ReleaseButton_4Pushed(app, event)
            global a;
            handles.a.motorRun(4,'release');
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Color = [0.651 0.651 0.651];
            app.UIFigure.Position = [100 100 555 434];
            app.UIFigure.Name = 'UI Figure';

            % Create ForwardButton_1
            app.ForwardButton_1 = uibutton(app.UIFigure, 'push');
            app.ForwardButton_1.ButtonPushedFcn = createCallbackFcn(app, @ForwardButton_1Pushed, true);
            app.ForwardButton_1.BackgroundColor = [1 1 0];
            app.ForwardButton_1.Position = [91 305 100 50];
            app.ForwardButton_1.Text = 'Forward';

            % Create ReleaseButton_1
            app.ReleaseButton_1 = uibutton(app.UIFigure, 'push');
            app.ReleaseButton_1.ButtonPushedFcn = createCallbackFcn(app, @ReleaseButton_1Pushed, true);
            app.ReleaseButton_1.BackgroundColor = [1 1 0];
            app.ReleaseButton_1.Position = [261 305 100 50];
            app.ReleaseButton_1.Text = 'Release';

            % Create BackwardButton_1
            app.BackwardButton_1 = uibutton(app.UIFigure, 'push');
            app.BackwardButton_1.ButtonPushedFcn = createCallbackFcn(app, @BackwardButton_1Pushed, true);
            app.BackwardButton_1.BackgroundColor = [1 1 0];
            app.BackwardButton_1.Position = [431 305 100 50];
            app.BackwardButton_1.Text = 'Backward';

            % Create ForwardButton_2
            app.ForwardButton_2 = uibutton(app.UIFigure, 'push');
            app.ForwardButton_2.ButtonPushedFcn = createCallbackFcn(app, @ForwardButton_2Pushed, true);
            app.ForwardButton_2.BackgroundColor = [1 1 0];
            app.ForwardButton_2.Position = [91 225 100 50];
            app.ForwardButton_2.Text = 'Forward';

            % Create ReleaseButton_2
            app.ReleaseButton_2 = uibutton(app.UIFigure, 'push');
            app.ReleaseButton_2.ButtonPushedFcn = createCallbackFcn(app, @ReleaseButton_2Pushed, true);
            app.ReleaseButton_2.BackgroundColor = [1 1 0];
            app.ReleaseButton_2.Position = [261 225 100 50];
            app.ReleaseButton_2.Text = 'Release';

            % Create BackwardButton_2
            app.BackwardButton_2 = uibutton(app.UIFigure, 'push');
            app.BackwardButton_2.ButtonPushedFcn = createCallbackFcn(app, @BackwardButton_2Pushed, true);
            app.BackwardButton_2.BackgroundColor = [1 1 0];
            app.BackwardButton_2.Position = [431 225 100 50];
            app.BackwardButton_2.Text = 'Backward';

            % Create ForwardButton_3
            app.ForwardButton_3 = uibutton(app.UIFigure, 'push');
            app.ForwardButton_3.ButtonPushedFcn = createCallbackFcn(app, @ForwardButton_3Pushed, true);
            app.ForwardButton_3.BackgroundColor = [1 1 0];
            app.ForwardButton_3.Position = [91 145 100 50];
            app.ForwardButton_3.Text = 'Forward';

            % Create ReleaseButton_3
            app.ReleaseButton_3 = uibutton(app.UIFigure, 'push');
            app.ReleaseButton_3.ButtonPushedFcn = createCallbackFcn(app, @ReleaseButton_3Pushed, true);
            app.ReleaseButton_3.BackgroundColor = [1 1 0];
            app.ReleaseButton_3.Position = [261 145 100 50];
            app.ReleaseButton_3.Text = 'Release';

            % Create BackwardButton_3
            app.BackwardButton_3 = uibutton(app.UIFigure, 'push');
            app.BackwardButton_3.ButtonPushedFcn = createCallbackFcn(app, @BackwardButton_3Pushed, true);
            app.BackwardButton_3.BackgroundColor = [1 1 0];
            app.BackwardButton_3.Position = [431 145 100 50];
            app.BackwardButton_3.Text = 'Backward';

            % Create RightButton
            app.RightButton = uibutton(app.UIFigure, 'push');
            app.RightButton.ButtonPushedFcn = createCallbackFcn(app, @RightButtonPushed, true);
            app.RightButton.BackgroundColor = [1 1 0];
            app.RightButton.Position = [91 65 100 50];
            app.RightButton.Text = 'Right';

            % Create ReleaseButton_4
            app.ReleaseButton_4 = uibutton(app.UIFigure, 'push');
            app.ReleaseButton_4.ButtonPushedFcn = createCallbackFcn(app, @ReleaseButton_4Pushed, true);
            app.ReleaseButton_4.BackgroundColor = [1 1 0];
            app.ReleaseButton_4.Position = [261 65 100 50];
            app.ReleaseButton_4.Text = 'Release';

            % Create LeftButton
            app.LeftButton = uibutton(app.UIFigure, 'push');
            app.LeftButton.ButtonPushedFcn = createCallbackFcn(app, @LeftButtonPushed, true);
            app.LeftButton.BackgroundColor = [1 1 0];
            app.LeftButton.Position = [431 65 100 50];
            app.LeftButton.Text = 'Left';

            % Create ROBOTARMOWI535Label
            app.ROBOTARMOWI535Label = uilabel(app.UIFigure);
            app.ROBOTARMOWI535Label.HorizontalAlignment = 'center';
            app.ROBOTARMOWI535Label.VerticalAlignment = 'center';
            app.ROBOTARMOWI535Label.FontSize = 24;
            app.ROBOTARMOWI535Label.FontColor = [1 0 0];
            app.ROBOTARMOWI535Label.Position = [11 384 540 31];
            app.ROBOTARMOWI535Label.Text = 'ROBOT ARM OWI 535';

            % Create SelectPortDropDownLabel
            app.SelectPortDropDownLabel = uilabel(app.UIFigure);
            app.SelectPortDropDownLabel.HorizontalAlignment = 'right';
            app.SelectPortDropDownLabel.Position = [191 27 64 15];
            app.SelectPortDropDownLabel.Text = 'Select Port';

            % Create SelectPortDropDown
            app.SelectPortDropDown = uidropdown(app.UIFigure);
            app.SelectPortDropDown.Items = {'COM 1', 'COM 2', 'COM 3', 'COM 4'};
            app.SelectPortDropDown.Editable = 'on';
            app.SelectPortDropDown.ValueChangedFcn = createCallbackFcn(app, @SelectPortDropDownValueChanged, true);
            app.SelectPortDropDown.BackgroundColor = [1 1 1];
            app.SelectPortDropDown.Position = [270 23 100 22];
            app.SelectPortDropDown.Value = 'COM 3';

            % Create Motor1Label
            app.Motor1Label = uilabel(app.UIFigure);
            app.Motor1Label.HorizontalAlignment = 'center';
            app.Motor1Label.VerticalAlignment = 'center';
            app.Motor1Label.Position = [21 305 50 50];
            app.Motor1Label.Text = 'Motor 1';

            % Create Motor2Label
            app.Motor2Label = uilabel(app.UIFigure);
            app.Motor2Label.HorizontalAlignment = 'center';
            app.Motor2Label.VerticalAlignment = 'center';
            app.Motor2Label.Position = [21 225 50 50];
            app.Motor2Label.Text = 'Motor 2';

            % Create Motor3Label
            app.Motor3Label = uilabel(app.UIFigure);
            app.Motor3Label.HorizontalAlignment = 'center';
            app.Motor3Label.VerticalAlignment = 'center';
            app.Motor3Label.Position = [21 145 50 50];
            app.Motor3Label.Text = 'Motor 3';

            % Create Motor4Label
            app.Motor4Label = uilabel(app.UIFigure);
            app.Motor4Label.HorizontalAlignment = 'center';
            app.Motor4Label.VerticalAlignment = 'center';
            app.Motor4Label.Position = [21 65 50 50];
            app.Motor4Label.Text = 'Motor 4';
        end
    end

    methods (Access = public)

        % Construct app
        function app = owiGui

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end