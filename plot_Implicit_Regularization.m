function plot_Implicit_Regularization(lr, alpha, NUM_itr, init, Gammas, Loss_Type, delta)
    figure()
    y = alpha * [16; 18; 0];
    % Applying the updating method over different 
    switch Loss_Type

        case "L2"
            for j = 1:length(Gammas)
                gamma = Gammas(j);
                x = [[3, -1, 0]; [4, 2, 0]; [0, gamma, gamma]];
                
                w = [init, init, init];
                w1 = zeros(1, NUM_itr);
                w2 = zeros(1, NUM_itr);
                w3 = zeros(1, NUM_itr);
                
                % Updating the w
                for i = 1:NUM_itr
                 out1 = x * w';
                 out2 = (out1 + abs(out1)) / 2;
                 w = w + lr * sign(out2') .* (y' - out2') * x;
                 w1(i) = w(1);
                 w2(i) = w(2);
                 w3(i) = w(3);
                end
                plot3(w1, w2,w3, 'DisplayName',"gamma = " + num2str(gamma),'LineWidth',6);
                grid on
                hold on
            end
            title("L2 loss")

        case "L1" 
            for j = 1:length(Gammas)
                gamma = Gammas(j);
                x = [[3, -1, 0]; [4, 2, 0]; [0, gamma, gamma]];
                
                w = [init, init, init];
                w1 = zeros(1, NUM_itr);
                w2 = zeros(1, NUM_itr);
                w3 = zeros(1, NUM_itr);
                
                % Updating the w
                for i = 1:NUM_itr
                 out1 = x * w';
                 out2 = (out1 + abs(out1)) / 2;
                 w = w + lr * sign(out2') .* sign(y' - out2') * x;
                 w1(i) = w(1);
                 w2(i) = w(2);
                 w3(i) = w(3);
                end
                plot3(w1, w2,w3, 'DisplayName',"gamma = " + num2str(gamma),'LineWidth',6);
                grid on
                hold on
            end
            title("L1 loss")
            
        case "Log-Cosh"
            for j = 1:length(Gammas)
                gamma = Gammas(j);
                x = [[3, -1, 0]; [4, 2, 0]; [0, gamma, gamma]];
                
                w = [init, init, init];
                w1 = zeros(1, NUM_itr);
                w2 = zeros(1, NUM_itr);
                w3 = zeros(1, NUM_itr);
                
                % Updating the w
                for i = 1:NUM_itr
                 out1 = x * w';
                 out2 = (out1 + abs(out1)) / 2;
                 w = w + lr * sign(out2') .* tanh(y' - out2') * x;
                 w1(i) = w(1);
                 w2(i) = w(2);
                 w3(i) = w(3);
                end
                plot3(w1, w2,w3, 'DisplayName',"gamma = " + num2str(gamma),'LineWidth',6);
                grid on
                hold on
            end
            title("Log-Cosh loss")

        case "Huber_Loss"
            for j = 1:length(Gammas)
                gamma = Gammas(j);
                x = [[3, -1, 0]; [4, 2, 0]; [0, gamma, gamma]];
                
                w = [init, init, init];
                w1 = zeros(1, NUM_itr);
                w2 = zeros(1, NUM_itr);
                w3 = zeros(1, NUM_itr);
                
                % Updating the w
                for i = 1:NUM_itr
                 out1 = x * w';
                 out2 = (out1 + abs(out1)) / 2;
                 out3 = (y' - out2');
                 if abs(out3(1)) > delta
                    out3(1) = sign(out3(1)); 
                 end
                 if abs(out3(2)) > delta
                    out3(2) = sign(out3(2)); 
                  end
                 if abs(out3(3)) > delta
                    out3(3) = sign(out3(3)); 
                 end
                 w = w + lr * sign(out2') .* (out3) * x;
                 w1(i) = w(1);
                 w2(i) = w(2);
                 w3(i) = w(3);
                end
                plot3(w1, w2,w3, 'DisplayName',"gamma = " + num2str(gamma),'LineWidth',6);
                grid on
                hold on
            end
            title("Huber loss")

        otherwise
            disp("Loss function unkown")
    end
    
    xx = [5,5];
    yy = [-1,-1];
    zz = [-0.25, 0.05];
    plot3(xx, yy,zz, 'Color', [192/255,192/255,192/255], 'DisplayName','w1 = 5 & w2 = -1','LineWidth',3);
    grid on
    legend
end