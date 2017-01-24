%-----------------------------------------------------------------------------
% Copyright (c) 2011-2017 Benjamin Buch
%
% https://github.com/bebuch/big
%
% Distributed under the Boost Software License, Version 1.0. (See accompanying
% file LICENSE_1_0.txt or copy at https://www.boost.org/LICENSE_1_0.txt)
%-----------------------------------------------------------------------------

% write matrix in a binary file with the Fraunhofer IOF BIG-file format
function result = write_big(BIGfile, big_data, type)
    % attention: this function works only since MATLAB version R2011a
    fid = fopen(BIGfile, 'w');

    % write header (10 Byte)
    fwrite(fid, size(big_data), 'uint16');
    fwrite(fid, type, 'uint16');
    dummy = 0;
    fwrite(fid, dummy, 'uint32');

    result = true;

    % write data
    if type == 1 % unsigned 1 byte
        fwrite(fid, big_data, 'uint8');
    elseif type == 2 % unsigned 2 byte
        fwrite(fid, big_data, 'uint16');
    elseif type == 4 % unsigned 4 byte
        fwrite(fid, big_data, 'uint32');
    elseif type == 8 % unsigned 8 byte
        fwrite(fid, big_data, 'uint64');
    elseif type == 20 % float
        fwrite(fid, nan2undef(big_data), 'float32');
    elseif type == 24 % double
        fwrite(fid, nan2undef(big_data), 'float64');
    else
        result = false;
    end
    fclose(fid);
end

