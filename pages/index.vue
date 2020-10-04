<template>
  <div>
    <div v-if="quizList.length">
      <span
        v-for="(quiz, i) in quizList"
        :key="`quiz-${i}`"
      >
        <v-card
          class="mx-auto pa-1"
          max-width="700"
          dense
        >
          <v-card-title>
            問題
          </v-card-title>
          <v-card-text>
            {{ quiz.question }}
          </v-card-text>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('1', quiz.correct_no)">
            {{ quiz.answer_01 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('2', quiz.correct_no)">
            {{ quiz.answer_02 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="p-1" @click="showCorrectAnswer('3', quiz.correct_no)">
            {{ quiz.answer_03 }}
          </v-btn>
          <v-btn block outlined color="indigo" class="my-1" @click="showCorrectAnswer('4', quiz.correct_no)">
            {{ quiz.answer_04 }}
          </v-btn>
        </v-card>
      </span>
    </div>
    <div v-else>
      ユーザーが取得できませんでした
    </div>
  </div>
</template>

<script>
export default {
  async asyncData ({ $axios }) {
    let quizList = []
    await $axios.$get('/api/v1/quizzes')
      .then(res => (quizList = res))
    return { quizList }
  },
  computed: {
    dateFormat () {
      return (date) => {
        const dateTimeFormat = new Intl.DateTimeFormat(
          'ja', { dateStyle: 'medium', timeStyle: 'short' }
        )
        return dateTimeFormat.format(new Date(date))
      }
    }
  },
  methods: {
    showCorrectAnswer (answer, correctNo) {
      if (answer === correctNo) {
        alert('正解')
        return
      }
      alert('不正解')
    }
  }
}
</script>
