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
-- package tags.admin.customizers

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local StoreValidationTransformTag = require("tags.StoreValidationTransformTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ViewCustomizersTag = {}
ViewCustomizersTag.__index = ViewCustomizersTag
ViewCustomizersTag.className = "ViewCustomizersTag"
setmetatable(ViewCustomizersTag, {__index = StoreValidationTransformTag})


function ViewCustomizersTag.new()
    local self = setmetatable(StoreValidationTransformTag.new(), ViewCustomizersTag)
    return self
end


-- throws JspTagException
function ViewCustomizersTag:doStartTag()
        local try_ok, try_error = pcall(function()
            self:setName("Add Validation Customizers View")
            self:setObjectFile("views.admin.customizers.CustomizersValidationView")
            return StoreValidationTransformTag.doStartTag(self)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return ViewCustomizersTag

