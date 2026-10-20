--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TransformInfoHttpFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local PaymentProcessorComponent = require("views.admin.payment.PaymentProcessorComponent")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentProcessHelper = {}
PaymentProcessHelper.__index = PaymentProcessHelper
PaymentProcessHelper.className = "PaymentProcessHelper"
setmetatable(PaymentProcessHelper, {__index = TagHelper})

function PaymentProcessHelper:_init_fields()
    self.paymentProcessorComponent = nil
end


function PaymentProcessHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(TagHelper.new(), PaymentProcessHelper)
    self:_init_fields()
        local transformInfoInterface = TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext)
        self.paymentProcessorComponent = PaymentProcessorComponent.new(transformInfoInterface)
    return self
end


-- throws Exception
function PaymentProcessHelper:process()
        return self.paymentProcessorComponent:view()
end

return PaymentProcessHelper

