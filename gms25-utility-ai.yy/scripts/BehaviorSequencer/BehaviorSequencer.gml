function BehaviorSequencer(goal, actions) constructor {
    goal = goal;
    actions = actions;
    steps = [];
    currentStep = 0;
    DetermineSteps(goal);

    function DetermineSteps(goal) {
        // Recursively determine steps required to achieve the goal
        var action = actions[goal];
        if (!is_undefined(action)) {
            for (var i = 0; i < array_length(action.requirements); i++) {
                var req = action.requirements[i];
                DetermineSteps(req);
            }
            array_push(steps,action);
        }
    }

    function NextStep() {
        if (currentStep < array_length(steps)) {
            var step = steps[currentStep];
            if (step.Condition()) {
                currentStep++;
                return step;
            }
        }
        return undefined; // No more steps or condition not met
    }

    function Reset() {
        currentStep = 0;
    }
}