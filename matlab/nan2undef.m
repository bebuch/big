%-----------------------------------------------------------------------------
% Copyright (c) 2011-2017 Benjamin Buch
%
% https://github.com/bebuch/big
%
% Distributed under the Boost Software License, Version 1.0. (See accompanying
% file LICENSE_1_0.txt or copy at https://www.boost.org/LICENSE_1_0.txt)
%-----------------------------------------------------------------------------

% changes all NANs into 3.402823466385289e+38
function result = nan2undef(big_data)
    wh = size(big_data);
    width = wh(1);
    height = wh(2);
    result = big_data;
    for x = 1 : 1 : width
        for y = 1 : 1 : height
            if isnan(big_data(x, y))
                result(x, y) = 3.402823466e+38;
            end
        end
    end
end
