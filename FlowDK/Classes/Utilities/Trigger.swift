//
//  Trigger.swift
//  Pods
//
//  Created by JP McGlone on 2/3/17.
//
//

public class Trigger {
    // MARK: - Private properties
    
    // To temporarily, or permanently, disable the trigger, call invalidate()
    private var _valid = true
    
    // MARK: - Public properties
    
    /**
     A Condition returns true to make the Trigger fire its action
     - parameter trigger: the Trigger that owns this Condition
     - returns: true or false
     */
    public typealias Condition = (_ trigger: Trigger) -> Bool
    
    /**
     An Action is fired when the Trigger's condition returns true
     - parameter trigger: the Trigger that owns this Action
     */
    public typealias Action = (_ trigger: Trigger) -> Void
    
    /**
     The condition that will make the Trigger fire its action
     */
    public let condition: Condition
    
    /**
     The action to fire when the condition is true
     */
    private let action: Action
    
    // MARK: - Init
    
    public init(condition: @escaping Condition, action: @escaping Action) {
        self .condition = condition
        self.action = action
    }
    
    // MARK: - Public methods
    
    /**
     Pulls the Trigger. If the Trigger is valid and the `condition` returns true,
     the `action` will be called
     */
    public func pull() {
        if _valid && condition(self) {
            action(self)
        }
    }
    
    /**
     Invalidating the Trigger prevents it from firing even if the condition is true.
     
     Think of this as having the safety on.
     */
    public func invalidate() {
        _valid = false
    }
    
    /**
     Validating the Trigger allows it to fire when the condition is true.
     
     Think of this as having the safety off. 
     
     **Triggers are valid by default**
     */
    public func validate() {
        _valid = true
    }
}
