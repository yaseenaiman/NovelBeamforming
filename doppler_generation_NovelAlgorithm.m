function [f_doppler, distance, thetar] = doppler_generation_NovelAlgorithm(Elevation_Angle,fc, h)

Re = 6.37e6;          % Earth's radius in meters
R = Re+h;           % Satellite LEO circular orbit radius in meters
i = deg2rad(75);      % Inclination in radians
we = 7.292115e-5;     % Earth's rotation rate in rad/second
ws = 9.3077e-4;       % Satellite's angular velocity in rad/sec
Thetao = deg2rad(20); % Initial Theta in radians
Theta = deg2rad(20:1:90); % Range of Theta values in radians
c = 3e8;              % Speed of light in meters/second

% Calculate visibility (tao) for each Theta value
tao = zeros(size(Theta));
for idx = 1:length(Theta)
    xx= cos(acos((Re / R) * cos(Thetao)) - Thetao);
    yy =cos(acos((Re / R) * cos(Theta(idx))) - Theta(idx));
    arg = acos( xx/ yy);
    tao(idx) = 2 / (ws - (we * cos(i))) * arg;
end

  index_theta = find(Theta == deg2rad(Elevation_Angle));

  Thetat1 = (Theta(index_theta));
  t1= tao(index_theta)/2;
  t=0:0.1:round(tao(index_theta));
  Doppler = zeros(1,length(t));
  alphat1 = acos(Re/R*cos(Thetat1))-Thetat1;
for idx =1: length(t)
      psi  = (ws-we*cos(i))*(t(idx)-t1);
      op = -Re*R *sin(psi)*cos(acos((Re / R) * cos(Thetat1)) - Thetat1);
      on= c*sqrt(Re^2+R^2 - 2*Re*R*cos(psi)*cos(acos((Re / R) * cos(Thetat1)) - Thetat1));
      wf= ws-we*cos(i);  
      DeltaF(idx)= fc*op/on*wf;
      alpha(idx) = acos(cos(psi)*cos(alphat1));
      s(idx)=sqrt(Re^2+R^2-2*Re*R*cos(alpha(idx)));
    theta(idx)=  acos(R*sin(alpha(idx))/s(idx));
end

index_theta2 = find(theta < (deg2rad(Elevation_Angle + 0.0005)) & theta > (deg2rad(Elevation_Angle - 0.0005)));
 f_doppler= DeltaF(index_theta2(4));

distance = s(index_theta2(4));
thetar = rad2deg(theta(index_theta2(4)));
 