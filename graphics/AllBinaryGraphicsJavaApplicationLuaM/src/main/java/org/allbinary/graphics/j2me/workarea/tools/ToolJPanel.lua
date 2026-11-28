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
-- package org.allbinary.graphics.j2me.workarea.tools

local ToolJPanel = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.ToolJPanel"] = ToolJPanel

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

-- local Font = require("java.awt.Font")
-- local GridLayout = require("java.awt.GridLayout")
-- local MouseAdapter = require("java.awt.event.MouseAdapter")
-- local MouseEvent = require("java.awt.event.MouseEvent")
-- local JButton = require("javax.swing.JButton")
-- local JList = require("javax.swing.JList")
-- local JPanel = require("javax.swing.JPanel")
local LinesGraphicItem = java_lazy("org.allbinary.graphics.j2me.workarea.tools.LinesGraphicItem")
local ToolFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.ToolFactory")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

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

-- class table ToolJPanel is declared before the requires
ToolJPanel.__index = ToolJPanel
ToolJPanel.className = "ToolJPanel"
ToolJPanel.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.ToolJPanel"
setmetatable(ToolJPanel, {__index = JPanel})

function ToolJPanel:_init_fields()
    if self.arcJButton == nil then self.arcJButton = nil end
    if self.charJButton == nil then self.charJButton = nil end
    if self.colorJList == nil then self.colorJList = nil end
    if self.colorJPanel == nil then self.colorJPanel = nil end
    if self.dottedArcJButton == nil then self.dottedArcJButton = nil end
    if self.dottedFillArcJButton == nil then self.dottedFillArcJButton = nil end
    if self.dottedFillRectJButton == nil then self.dottedFillRectJButton = nil end
    if self.dottedFillRountRectJButton == nil then self.dottedFillRountRectJButton = nil end
    if self.dottedLineJButton == nil then self.dottedLineJButton = nil end
    if self.dottedRectButton == nil then self.dottedRectButton = nil end
    if self.fillArcJButton == nil then self.fillArcJButton = nil end
    if self.fillRectJButton == nil then self.fillRectJButton = nil end
    if self.fillRoundRectJButton == nil then self.fillRoundRectJButton = nil end
    if self.imageJButton == nil then self.imageJButton = nil end
    if self.lineJButton == nil then self.lineJButton = nil end
    if self.rectJButton == nil then self.rectJButton = nil end
    if self.roundRectJButton == nil then self.roundRectJButton = nil end
    if self.stringJButton == nil then self.stringJButton = nil end
end


function ToolJPanel._jinit(self)
    java_super_init(JPanel, self)
    ToolJPanel._init_fields(self)
        self:initComponents()
    return self
end

function ToolJPanel.new(...)
    local self = setmetatable({}, ToolJPanel)
    ToolJPanel._jinit(self, ...)
    return self
end


function ToolJPanel:initComponents()
        self.lineJButton = JButton.new()
        self.rectJButton = JButton.new()
        self.arcJButton = JButton.new()
        self.stringJButton = JButton.new()
        self.charJButton = JButton.new()
        self.roundRectJButton = JButton.new()
        self.imageJButton = JButton.new()
        self.fillArcJButton = JButton.new()
        self.fillRectJButton = JButton.new()
        self.fillRoundRectJButton = JButton.new()
        self.dottedLineJButton = JButton.new()
        self.dottedRectButton = JButton.new()
        self.dottedArcJButton = JButton.new()
        self.dottedFillRectJButton = JButton.new()
        self.dottedFillArcJButton = JButton.new()
        self.dottedFillRountRectJButton = JButton.new()
        self.colorJPanel = JPanel.new()
        self.colorJList = JList.new()
        self:setLayout(GridLayout.new(17, 1))
        self.lineJButton:setFont(Font.new("Dialog", 0, 10))
        self.lineJButton:setText(LinesGraphicItem.getStaticName())
        self.lineJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                ;(self.lineJButtonMouseClicked and self or java_outer_self):lineJButtonMouseClicked(evt)
            
            end
            java_overload(o, "mouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.lineJButton)
        self.rectJButton:setFont(Font.new("Dialog", 0, 10))
        self.rectJButton:setText("Rect")
        self.rectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mouseClicked(evt)
                ;(self.rectJButtonMouseClicked and self or java_outer_self):rectJButtonMouseClicked(evt)
            
            end
            java_overload(o, "mouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.rectJButton)
        self.arcJButton:setFont(Font.new("Dialog", 0, 10))
        self.arcJButton:setText("Arc")
        self.arcJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.arcJButtonMousePressed and self or java_outer_self):arcJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.arcJButton)
        self.stringJButton:setFont(Font.new("Dialog", 0, 10))
        self.stringJButton:setText("String")
        self.stringJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.stringJButtonMousePressed and self or java_outer_self):stringJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.stringJButton)
        self.charJButton:setFont(Font.new("Dialog", 0, 10))
        self.charJButton:setText("Char")
        self.charJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.charJButtonMousePressed and self or java_outer_self):charJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.charJButton)
        self.roundRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.roundRectJButton:setText("Round Rect")
        self.roundRectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.roundRectJButtonMousePressed and self or java_outer_self):roundRectJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.roundRectJButton)
        self.imageJButton:setFont(Font.new("Dialog", 0, 10))
        self.imageJButton:setText("Image")
        self.imageJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.imageJButtonMousePressed and self or java_outer_self):imageJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.imageJButton)
        self.fillArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillArcJButton:setText("Fill Arc")
        self.fillArcJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.fillArcJButtonMousePressed and self or java_outer_self):fillArcJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.fillArcJButton)
        self.fillRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillRectJButton:setText("Fill Rect")
        self.fillRectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.fillRectJButtonMousePressed and self or java_outer_self):fillRectJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.fillRectJButton)
        self.fillRoundRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.fillRoundRectJButton:setText("Fill Rnd Rect")
        self.fillRoundRectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.fillRoundRectJButtonMousePressed and self or java_outer_self):fillRoundRectJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.fillRoundRectJButton)
        self.dottedLineJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedLineJButton:setText("Dot Line")
        self.dottedLineJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedLineJButtonMousePressed and self or java_outer_self):dottedLineJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedLineJButton)
        self.dottedRectButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedRectButton:setText("Dot Rect")
        self.dottedRectButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedRectButtonMousePressed and self or java_outer_self):dottedRectButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedRectButton)
        self.dottedArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedArcJButton:setText("Dot Arc")
        self.dottedArcJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedArcJButtonMousePressed and self or java_outer_self):dottedArcJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedArcJButton)
        self.dottedFillRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillRectJButton:setText("Dot Fill Rect")
        self.dottedFillRectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedFillRectJButtonMousePressed and self or java_outer_self):dottedFillRectJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedFillRectJButton)
        self.dottedFillArcJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillArcJButton:setText("Dot Fill Arc")
        self.dottedFillArcJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedFillArcJButtonMousePressed and self or java_outer_self):dottedFillArcJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedFillArcJButton)
        self.dottedFillRountRectJButton:setFont(Font.new("Dialog", 0, 10))
        self.dottedFillRountRectJButton:setText("Dot Fill Rnd Rect")
        self.dottedFillRountRectJButton:addMouseListener((function()
            local java_outer_self = self
        local o = MouseAdapter.new and MouseAdapter.new() or setmetatable({}, {__index = MouseAdapter})
            

            function o:mousePressed(evt)
                ;(self.dottedFillRountRectJButtonMousePressed and self or java_outer_self):dottedFillRountRectJButtonMousePressed(evt)
            
            end
            java_overload(o, "mousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)
            return o
        end)())
        self:add(self.dottedFillRountRectJButton)
        self.colorJPanel:setLayout(GridLayout.new(1, 1))
        self.colorJPanel:add(self.colorJList)
        self:add(self.colorJPanel)
end
java_overload(ToolJPanel, "initComponents", 0)


function ToolJPanel:dottedFillRountRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillRountRectJButton:getText())
end
java_overload(ToolJPanel, "dottedFillRountRectJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:dottedFillArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillArcJButton:getText())
end
java_overload(ToolJPanel, "dottedFillArcJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:dottedFillRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedFillRectJButton:getText())
end
java_overload(ToolJPanel, "dottedFillRectJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:dottedArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedArcJButton:getText())
end
java_overload(ToolJPanel, "dottedArcJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:dottedRectButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedRectButton:getText())
end
java_overload(ToolJPanel, "dottedRectButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:dottedLineJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.dottedLineJButton:getText())
end
java_overload(ToolJPanel, "dottedLineJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:fillRoundRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillRoundRectJButton:getText())
end
java_overload(ToolJPanel, "fillRoundRectJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:fillRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillRectJButton:getText())
end
java_overload(ToolJPanel, "fillRectJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:fillArcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.fillArcJButton:getText())
end
java_overload(ToolJPanel, "fillArcJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:imageJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.imageJButton:getText())
end
java_overload(ToolJPanel, "imageJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:roundRectJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.roundRectJButton:getText())
end
java_overload(ToolJPanel, "roundRectJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:charJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.charJButton:getText())
end
java_overload(ToolJPanel, "charJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:stringJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.stringJButton:getText())
end
java_overload(ToolJPanel, "stringJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:arcJButtonMousePressed(evt)
        ToolFactory.getInstance():setSelectedTool(self.arcJButton:getText())
end
java_overload(ToolJPanel, "arcJButtonMousePressed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:rectJButtonMouseClicked(evt)
        ToolFactory.getInstance():setSelectedTool(self.rectJButton:getText())
end
java_overload(ToolJPanel, "rectJButtonMouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)


function ToolJPanel:lineJButtonMouseClicked(evt)
        ToolFactory.getInstance():setSelectedTool(self.lineJButton:getText())
end
java_overload(ToolJPanel, "lineJButtonMouseClicked", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MouseEvent")) end)

return ToolJPanel

