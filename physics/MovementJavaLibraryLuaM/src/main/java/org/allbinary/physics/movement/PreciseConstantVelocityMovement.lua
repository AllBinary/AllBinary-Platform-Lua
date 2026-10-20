-- Generated Code Do Not Modify
-- package org.allbinary.physics.movement

local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local BasicVelocityProperties = require("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local ScaleFactorFactory = require("org.allbinary.logic.math.ScaleFactorFactory")
local BasicConstantVelocityMovement = require("org.allbinary.physics.movement.BasicConstantVelocityMovement")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreciseConstantVelocityMovement = {}
PreciseConstantVelocityMovement.__index = PreciseConstantVelocityMovement
PreciseConstantVelocityMovement.className = "PreciseConstantVelocityMovement"
setmetatable(PreciseConstantVelocityMovement, {__index = BasicConstantVelocityMovement})

function PreciseConstantVelocityMovement:_init_fields()
    self.accumulatedX = 0
    self.accumulatedY = 0
    self.accumulatedZ = 0
    self.factorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE
end


function PreciseConstantVelocityMovement.new(basicDecimal, velocityProperties)
    local self = setmetatable(BasicConstantVelocityMovement.new(basicDecimal, velocityProperties), PreciseConstantVelocityMovement)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function PreciseConstantVelocityMovement:init(speedBasicDecimal, angle, otherAngle)
end


-- throws Exception
function PreciseConstantVelocityMovement:process(layer)
        local mathUtil = MathUtil.getInstance()
        local velocityProperties = self:getVelocityProperties()
        self.accumulatedX = java_int((self.accumulatedX + velocityProperties:getVelocityXBasicDecimalP():getUnscaled()))
        self.accumulatedY = java_int((self.accumulatedY + velocityProperties:getVelocityYBasicDecimalP():getUnscaled()))
        self.accumulatedZ = java_int((self.accumulatedZ + velocityProperties:getVelocityZBasicDecimalP():getUnscaled()))
        layer:moveDXYZ(java_idiv(self.accumulatedX, self.factorValue), java_idiv(self.accumulatedY, self.factorValue), java_idiv(self.accumulatedZ, self.factorValue))
        if mathUtil:abs(self.accumulatedX) > self.factorValue then
            self.accumulatedX = 0
        end
        if mathUtil:abs(self.accumulatedY) > self.factorValue then
            self.accumulatedY = 0
        end
        if mathUtil:abs(self.accumulatedZ) > self.factorValue then
            self.accumulatedZ = 0
        end
end

return PreciseConstantVelocityMovement

