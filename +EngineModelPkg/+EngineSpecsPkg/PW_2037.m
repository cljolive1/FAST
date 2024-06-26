function [Engine] = PW_2037()
%
% [Engine] = PW_2037()
% Written By Maxfield Arnson
% Last Updated: 11/7/2023
%
% Engine specification function for use with the EngineModelPkg
%
% Type = Turbofan
% Applicable Aircraft = None

%% Design Point Values

% Design point Mach Number 
% If SLS, enter 0.05
Engine.Mach = 0.05;%85;

% Design point Altitude [m]
% If SLS, enter 0
Engine.Alt = 0;%10668;

% Overall Pressure Ratio 
Engine.OPR = 27.4;

% Fan Pressure Ratio
Engine.FPR = 1.63;

% Bypass Ratio
Engine.BPR = 5.8; 

% Combustion Temperature [K]
% If unknown, 2000 is a good guess
Engine.Tt4Max = 1500;

% Temperature Limits [K]
% Not functional yet. Leave these values as NaN
Engine.TempLimit.Val = NaN;
Engine.TempLimit.Type = NaN;

% Design point thrust [N]
Engine.DesignThrust = 166941;



%% Architecture

% Number of Spools
% Value between 1 and 3 (historically this is the case)
Engine.NoSpools = 2;

% Spool RPMs
% Enter a 1xN vector where N = Engine.NoSpools
% in the order: Fan Spool, Intermediate Pressure Spool, High Pressure Spool
% omit any spools that do not exist but preserve the order
Engine.RPMs = [4575,12250];

% Gear Ratio
% enter NaN if not geared
% if ratio is entered, make sure Engine.RPMs(1) is the fan spool rpm (LPT rpm),
% not the fan rpm. This will get calculated from the gear ratio
Engine.FanGearRatio = NaN;

% Fan Boosters (Boolean: enter true or false)
% If the low pressure compressor is connected to the fan shaft or not
% it is almost always the case that an engine will not be geared and
% boosted
Engine.FanBoosters = false;

%% Airflows

% Passenger Bleeds
% Typically 0.03
Engine.CoreFlow.PaxBleed = 0.00;

% Air leakage
% Typically 1%
Engine.CoreFlow.Leakage = 0.00;

% Core Cooling Flow
Engine.CoreFlow.Cooling = 0.0;

%% Sizing Limits

% Maximum iterations allowed in the engine sizing loop
Engine.MaxIter = 300;


%% Efficiencies
% Polytropic component efficiencies
Engine.EtaPoly.Inlet = 0.99;
Engine.EtaPoly.Diffusers = 0.99;
Engine.EtaPoly.Fan = 0.9;
Engine.EtaPoly.Compressors = 0.9;
Engine.EtaPoly.BypassNozzle = 0.99;
Engine.EtaPoly.Combustor = 0.995;
Engine.EtaPoly.Turbines = 0.9;
Engine.EtaPoly.CoreNozzle = 0.98;
Engine.EtaPoly.Nozzles = 0.98;
Engine.EtaPoly.Mixing = 0.0;



end