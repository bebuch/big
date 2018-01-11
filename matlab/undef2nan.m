%-----------------------------------------------------------------------------
% Copyright (c) 2011-2018 Benjamin Buch
%
% https://github.com/bebuch/big
%
% Distributed under the Boost Software License, Version 1.0. (See accompanying
% file LICENSE_1_0.txt or copy at https://www.boost.org/LICENSE_1_0.txt)
%-----------------------------------------------------------------------------

% changes all values bigger than 3.4e+38 into NAN
function result = undef2nan(big_data)
    wh = size(big_data);
    width = wh(1);
    height = wh(2);
    result = big_data;
    for x = 1 : 1 : width
        for y = 1 : 1 : height
            if big_data(x, y) >= 3.4e+38
                result(x, y) = nan;
            end
        end
    end
end
