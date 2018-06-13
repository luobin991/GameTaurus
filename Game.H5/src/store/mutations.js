export const increment = state => {
    state.count = state.count + 5
}
export const decrement = state => {
    state.count = state.count - 3
}


export const showPass = state => {
    state.isPass = !state.isPass
}

export const changeName = (state, data) => {
    state.userName = data.name
}


export const changeMsg = (state, data) => {
    state.msg = data.msg
}

export const changeShowMsg = (state, data) => {
    state.showMsg = data.showMsg
}