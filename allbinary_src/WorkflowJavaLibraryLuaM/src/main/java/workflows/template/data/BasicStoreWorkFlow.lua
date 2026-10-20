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
-- package workflows.template.data

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreWorkFlowInterface = require("org.allbinary.logic.control.workflow.StoreWorkFlowInterface")
local BasicWorkFlow = require("workflows.template.data.BasicWorkFlow")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicStoreWorkFlow = {}
BasicStoreWorkFlow.__index = BasicStoreWorkFlow
BasicStoreWorkFlow.className = "BasicStoreWorkFlow"
setmetatable(BasicStoreWorkFlow, {__index = BasicWorkFlow})


function BasicStoreWorkFlow.new(propertiesHashMap, pageContext)
    local self = setmetatable(BasicWorkFlow.new(propertiesHashMap, pageContext), BasicStoreWorkFlow)
        -- super(...) made self above
    return self
end


-- throws Exception
function BasicStoreWorkFlow:getStoreName()
        return self:getPropertiesHashMap():get(StoreFrontData.getInstance().NAME)
end

return BasicStoreWorkFlow

