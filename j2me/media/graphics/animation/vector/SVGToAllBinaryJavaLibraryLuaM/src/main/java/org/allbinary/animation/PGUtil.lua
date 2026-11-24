-- Generated Code Do Not Modify
-- package org.allbinary.animation

local PGUtil = {}
package.loaded["org.allbinary.animation.PGUtil"] = PGUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local FixedPoint = java_lazy("org.allbinary.animation.FixedPoint")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PGUtil is declared before the requires
PGUtil.__index = PGUtil
PGUtil.className = "PGUtil"
PGUtil.javaClassName = "org.allbinary.animation.PGUtil"

function PGUtil._jinit(self)
    return self
end

function PGUtil.new()
    return PGUtil._jinit(setmetatable({}, PGUtil))
end


function PGUtil.getInstance()
        return PGUtil.instance_f
end


function PGUtil:flattenCubicBezier(x0, y0, x1, y1, x2, y2, x3, y3, outX, outY, count, maxPoints)
        local fixedPoint = FixedPoint.getInstance()
        local steps = 10
        for i = 1, steps do
            local t = fixedPoint:div(fixedPoint:toFixed((i + 0.0)), fixedPoint:toFixed(steps))
            local mt = fixedPoint.ONE - t
            local mt3 = fixedPoint:mul(fixedPoint:mul(mt, mt), mt)
            local mt2t3 = 3 * fixedPoint:mul(fixedPoint:mul(mt, mt), t)
            local mtt23 = 3 * fixedPoint:mul(fixedPoint:mul(mt, t), t)
            local t3 = fixedPoint:mul(fixedPoint:mul(t, t), t)
            local x = fixedPoint:mul(mt3, x0) + fixedPoint:mul(mt2t3, x1) + fixedPoint:mul(mtt23, x2) + fixedPoint:mul(t3, x3)
            local y = fixedPoint:mul(mt3, y0) + fixedPoint:mul(mt2t3, y1) + fixedPoint:mul(mtt23, y2) + fixedPoint:mul(t3, y3)
            if count[1] < maxPoints then
                outX[count[1] + 1] = x
                outY[count[1] + 1] = y
                count[1] = count[1] + 1
            end
        end
end

PGUtil.instance_f = PGUtil.new()

return PGUtil

