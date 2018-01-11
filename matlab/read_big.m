%-----------------------------------------------------------------------------
% Copyright (c) 2011-2018 Benjamin Buch
%
% https://github.com/bebuch/big
%
% Distributed under the Boost Software License, Version 1.0. (See accompanying
% file LICENSE_1_0.txt or copy at https://www.boost.org/LICENSE_1_0.txt)
%-----------------------------------------------------------------------------

% read binary files which have the Fraunhofer IOF BIG-file format
% output: matrix with size 'width' cross 'height'
function result = read_big(BIGfile)
    % attention: this function works only since MATLAB version R2011a
    fid = fopen(BIGfile, 'r');

    % read header (10 Byte)
    width  = fread(fid, 1, 'uint16');
    height = fread(fid, 1, 'uint16');
    type   = fread(fid, 1, 'uint16');
    fseek(fid, 4, 0);

    % read data
    if type == 1 % unsigned 1 byte
        result = fread(fid, [width, height], 'uint8');
    elseif type == 2 % unsigned 2 byte
        result = fread(fid, [width, height], 'uint16');
    elseif type == 4 % unsigned 4 byte
        result = fread(fid, [width, height], 'uint32');
    elseif type == 8 % unsigned 8 byte
        result = fread(fid, [width, height], 'uint64');
    elseif type == 20 % float
        result = undef2nan(fread(fid, [width, height], 'float32'));
    elseif type == 24 % double
        result = undef2nan(fread(fid, [width, height], 'float64'));
    end
    fclose(fid);
end
