document.addEventListener('turbo:load',(event) =>  {
    startClock();
});

export function startClock() {
    const dateElement = document.getElementById('date-display');
    const timeElement = document.getElementById('time-display');
    const dayOfWeekElement = document.getElementById('day-of-week-display');
    
    const daysOfWeek = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"];

    function updateClock() {
    const now = new Date();
    const dateString = now.toLocaleDateString();
    const timeString = now.toLocaleTimeString();
    const dayOfWeekString = daysOfWeek[now.getDay()];

    dateElement.textContent = dateString;
    timeElement.textContent = timeString;
    dayOfWeekElement.textContent = dayOfWeekString;
    }
    
    setInterval(updateClock, 1000);
    updateClock();
}